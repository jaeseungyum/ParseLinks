#' Parse a link header string with multiple urls & rels then convert it into a list
#'
#' @param link_header_string A length-one character
#' @return the parsed link header A list
#' @export
#' @example
#' parse('<alabla?limit=50&order=desc>; rel="meta", <alabla2?limit=100&order=asc>; rel="prev", <blabla>; rel="last"')

parse <- function(link_header_string) {
  unlist(lapply(splitter(link_header_string), parse_one), recursive = F)
} 


#' Parse a link header string with single url & rel then convert it into a list
#' 
#' @param link_header_string A length-one character
#' @return the parsed link header A list

parse_one <- function(link_header_string) { 
  url_exp    <- "(?:<)(.*)(?:>,?\\s?.*)"
  rel_exp    <- "(?:.*rel=[\"|'])(.*)(?:[\"|'])" 
  rel        <- gsub(rel_exp, "\\1", link_header_string)
  url        <- gsub(url_exp, "\\1", link_header_string) 
  out        <- list()
  out[[rel]] <- list(url = get_hostname(url))

  if (has_query_params(url)) { out[[rel]]$query <- query_composer(url) } 
  out
}


#' Get host name from the given url
#'
#' @param url A length-one character vector 
#' @return the host name A length-one character vector

get_hostname <- function(url) {
  gsub("^(.*)(?:\\?.*)", "\\1", url)
}


#' Test if a given url has query paramters or not
#'
#' @param url A length-one character vector 
#' @return A length-one logical vector

has_query_params <- function(url) {
  grepl("^(.*)(?:\\?.*)", url)
}
