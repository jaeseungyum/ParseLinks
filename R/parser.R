#' Parse a link header string
#' then converts link header into a list
#'
#' @param link_header_string A length-one character
#' @return the parsed link header A list

parser <- function(link_header_string) {
  unlist(lapply(splitter(link_header_string), parser_fun), recursive = F)
} 

parser_fun <- function(link_header_string) {
  url_exp <- "(?:<)(.*)(?:>,?\\s?.*)"
  rel_exp <- "(?:.*rel=[\"|'])(.*)(?:[\"|'])"

  key <- gsub(rel_exp, "\\1", link_header_string)
  url <- gsub(url_exp, "\\1", link_header_string)

  out <- list()
  out[[key]] <- list(url = url)

  return(out)
}
