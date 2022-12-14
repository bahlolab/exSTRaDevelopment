# The exstra_db class
# Includes information on STRs, whether they are disease-causing or of a general nature


#' check if the object is part of the exstra_db class
#' 
#' @param x Object to test.
#' @import data.table
#' @import stringr
#' @import testit
#' 
#' @export
is.exstra_db <- function(x) inherits(x, "exstra_db")

# Create a new object of this class (not for the user)
#
exstra_db_new_ <- function(strd, input_type = NULL) {
  # Transforms a data.frame or data.table into a exstra_db object
  if (!is.data.frame(strd)) stop("strd must be data.frame")
  strd <- data.table(strd)
  strd <- strd[!(is.na(chrom) | is.na(chromStart) | is.na(chromEnd))]
  strd$input_order <- seq(1, dim(strd)[1], 1)
  # TODO this should always just be locus, hack away!
  if(!is.null(strd$disease.symbol)) {
    #setkey(strd, "disease.symbol")
    setnames(strd, "disease.symbol", "locus")
  } 
  setkey(strd, "locus")
  structure(list(db = strd, input_type = input_type), class = c("exstra_db"))
}


#' @export
print.exstra_db <- function(x, ...) {
  cat(class(x)[1], " object with ", dim(x$db)[1], ifelse(dim(x$db)[1] == 1, " locus", " loci"), " ($db) of type ",  x$input_type, "\n",
    sep = "")
}

#' @export
loci.exstra_db <- function(x, ...) {
  # Give the loci names
  loci <- x$db[order(input_order), locus]
  assert("Could not identify the str loci", !is.null(loci))
  loci
}

# TODO: make these into generics

# Give text info for the locus
# 
# Usually used in plot titles.
# @param x object of class exstra_db
# @param locus Locus to get the information of
loci_text_info.exstra_db <- function(x, locus) {
  # gives text info for the locus, usually used in plot titles
  # TODO: modify this:
  assert("The class of x must be exstra_db", is.exstra_db(x))
  locus.in <- locus
  if(x$input_type == "named") {
    x.info <- x$db[locus.in == locus]
    #TODO: this is wrong
    assert(paste("The locus", locus, "was not found"), dim(x.info)[1] >= 1)
    assert(paste("There were multiple entries for locus", locus), dim(x.info)[1] <= 1)
    rs.len <- with(x.info, nchar(as.character(motif)))
    normal.copyNum <- with(x.info, floor(copyNum))
    normal.size.bp <- with(x.info, round(copyNum * rs.len))
    return(with(x.info,  
      paste0(locus, " (", 
        gene_region, " ", motif, ") norm: ", normal.copyNum, 
        " (", normal.size.bp, "bp) , exp: ", aff_low, " (", 
        floor(aff_low * rs.len), "bp)"))
    )
  } else if (x$input_type == "ucsc") {
    x.info <- x$db[locus.in == locus] 
    #TODO: this is wrong
    assert(paste("The locus", locus, "was not found"), dim(x.info)[1] >= 1)
    assert(paste("There were multiple entries for locus", locus), dim(x.info)[1] <= 1)
    rs.len <- with(x.info, nchar(as.character(motif)))
    # normal.copyNum <- with(x.info, floor(copyNum))
    # normal.size.bp <- with(x.info, floor(copyNum * rs.len))
    return(with(x.info,  
      paste0(locus))
    )
  } else {
    stop("Unrecognised input_type in exstra_db. Got ", x$input_type)
  }
}


#' Give the reference or normal size of the STR
#' 
#' This function may not work as intended may be deleted.
#' 
#' @param x Object that inherits from exstra_db
#' @param locus Locus name to get the reference size from.
#' @export
loci_normal <- function(x, locus) {
  loci_normal_exp (x, locus)[1]
}

#' Give the minimum expanded size of the STR
#' 
#' This function may not work as intended may be deleted.
#' 
#' @param x Object that inherits from exstra_db
#' @param locus Locus name to get the reference size from.
#' @export
loci_min_exp <- function(x, locus) {
  # Give the minimum expanded STR in bp
  loci_normal_exp (x, locus)[2]
}

#' @export
`[.exstra_db` <- function(x, fil) {
  assert("locus not the key of x$db", key(x$db)[1] == "locus")
  x$db <- x$db[eval(substitute(fil))]
  x
}

# copy data.table inside
#' @export
copy.exstra_db <- function(x, ...) {
  x$db <- copy(x$db)
  x
}


# I think the following was code that was left over from another time
#Y <- exstra_db_read("/Users/tankard/Documents/Research/repeats/disease_repeats/repeat_disorders.xlsx")
#class(Y)


# TODO method for seqnames(exstra_db)

#TODO length(exstra_db) =  number of loci

#TODO dim(exstra_db) = dim(exstra_db$db)

# Verify keys of exstra_db
verify.exstra_db <- function(x) {
  assert("Object should inherit from class exstra_db.", is.exstra_db(x))
  assert("Key of x$db should be 'locus'", key(x$db) == "locus")
  invisible(TRUE)
}
