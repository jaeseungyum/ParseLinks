#' Parse a link header string
#' then converts link header into a list
#'
#' @param link_header_string A length-one character
#' @return the parsed link header A list

parser <- function(link_header_string) {
  unlist(lapply(splitter(link_header_string), parser_fun), recursive = F)
} 

parser_fun <- function(link_header_string) { 
  url_exp    <- "(?:<)(.*)(?:>,?\\s?.*)"
  rel_exp    <- "(?:.*rel=[\"|'])(.*)(?:[\"|'])" 
  rel        <- gsub(rel_exp, "\\1", link_header_string)
  url        <- gsub(url_exp, "\\1", link_header_string) 
  out        <- list()
  out[[rel]] <- list(url = get_base_url(url))

  if (has_query_params(url)) { out[[rel]]$query <- query_composer(url) } 
  return(out)
}

get_base_url <- function(url) {
  gsub("^(.*)(?:\\?.*)", "\\1", url)
}

has_query_params <- function(url) {
  grepl("^(.*)(?:\\?.*)", url)
}
