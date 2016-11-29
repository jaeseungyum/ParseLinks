#' Parse links 
#' 
#' Parses a link header text into an R list that contains each contained link
#'
#' @param x A character string indicating \code{link}s/\code{rel}s information. (E.g '<www.example.com/first>; rel="first", <www.example.com/second>; rel="second"')
#' @return A list keyed by the \code{rel} properties that contains information about each link
#' @export
#' @examples
#' parse_links('<http://example.com/first>; rel="meta", <http://example.com>; rel="home"')

parse_links <- function(x) {
  unlist(lapply(splitter(x), parse_link), recursive = F)
} 


#' Parse a link 
#' 
#' Parses a single link/rel information
#'
#' @param x A character string indicating \code{link}/\code{rel} information. (E.g <'www.example.com>; rel="meta"')
#' @return A list keyed by the \code{rel} property that contains information about the link 

parse_link <- function(x) { 
  url_exp    <- "(?:<)(.*)(?:>,?\\s?.*)"
  rel_exp    <- "(?:.*rel=[\"|'])(.*)(?:[\"|'])" 
  rel        <- gsub(rel_exp, "\\1", x)
  url        <- gsub(url_exp, "\\1", x) 
  out        <- list()
  out[[rel]] <- list(url = remove_query_params(url))

  if (has_query_params(url)) { out[[rel]]$query <- parse_query_string(url) } 
  out
}


#' Remove query paramter part from a url 
#'
#' @param url character string.
#' @return The query parameter removed url. A character string.

remove_query_params <- function(url) {
  gsub("^(.*)(?:\\?.*)", "\\1", url)
}


#' Test if a given url has query paramters or not
#'
#' @param url A character string
#' @return A logical 

has_query_params <- function(url) {
  grepl("^(.*)(?:\\?.*)", url)
}
