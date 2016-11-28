#' Compose query params list from the given query paramter string
#'
#' @param url A length-one character vector
#' @return the query paramters A list
query_composer <- function(url) {
  splitted <- strsplit(unlist(strsplit(get_query_part(url), "&")), "=")

  unlist(lapply(splitted, function(s) {
                  out <- list()
                  out[[s[1]]] <- cast_numeric(s[2])
                  out}), recursive = F)
}

#' Extract query part from the given url string
get_query_part <- function(url) {
  gsub("(?:^.*\\?)(.*)", "\\1", url)
}

#' Convert to numeric if the given string represents a number 
cast_numeric <- function(x) {
  if (grepl("^\\d+$", x)) { return(as.numeric(x)) }
  return(x)
}
