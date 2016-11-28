#' Parse a link header text 
#' then convert the length-one character vector into a character vector such like c('<url..>; rel=".."', '<url..>; rel=".."')
#'
#' @param link_header_string A length-one character vector
#' @return A character vector

splitter <- function(link_header_string) {
  gsub("^\\s", "", unlist(strsplit(link_header_string, ",")))
}
