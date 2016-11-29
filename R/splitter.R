#' Splitter 
#' 
#' Splits a text string by comma then returns a character vector
#'
#' @param x A character string
#' @return A character vector

splitter <- function(x) {
  gsub("^\\s", "", unlist(strsplit(x, ",")))
}
