#' Parse query string 
#' 
#' Parses query string into an R list.
#'
#' @param url A character string.
#' @return A list containing a representation of query paramters.
parse_query_string <- function(url) {
  splitted <- strsplit(unlist(strsplit(get_query_string(url), "&")), "=")

  unlist(lapply(splitted, function(s) {
                  out <- list()
                  out[[s[1]]] <- check_numeric(s[2])
                  out}), recursive = F)
}


#' Extract query string 
#'
#' Extracts query string from a given url
#'
#' @param url A character string.
#' @return A character string that represents the query string.

get_query_string <- function(url) {
  gsub("(?:^.*\\?)(.*)", "\\1", url)
}


#' Check numeric 
#'
#' Convert a given string into a numeric value if the string was supposed to be a number.
#' 
#' @param x A character vector.
#' @return A character string or a numeric. it depends on the pattern of the given string.

check_numeric <- function(x) {
  if (grepl("^\\d+$", x)) { return(as.numeric(x)) }
  return(x)
}
