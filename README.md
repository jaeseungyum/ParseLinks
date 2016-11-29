# ParseLinks

A simple link header parser for R. The function `parse_links` parses a link header strings into an R list for each contained link.

For more information about link header see: [Link Header - W3C Wiki](https://www.w3.org/wiki/LinkHeader)


## Quick Start

### Installation
```r
> library(devtools)
> devtools::install_github("jsng/ParseLinks")
```

### Basic Usage
```r
# Load ParseLinks package
library(ParseLinks)

link_txt <- 
  '<http://example.com/api/v1/results?before=aa33d3f8&limit=50&order=desc>; rel="first",
   <http://example.com/api/v1/results?before=4c1157e7&limit=50&order=desc>; rel="previous",
   <http://example.com/api/v1/results?after=d583cd85&limit=50&order=desc>; rel="next",
   <http://example.com/api/v1/results?after=61d9bf14&limit=50&order=desc>; rel="last"'

link_header <- parse_links(link_txt)
```

### The Result
```r
> str(link_header)

List of 4
 $ first   :List of 2
  ..$ url  : chr "http://example.com/api/v1/results"
  ..$ query:List of 3
  .. ..$ before: chr "aa33d3f8"
  .. ..$ limit : num 50
  .. ..$ order : chr "desc"
 $ previous:List of 2
  ..$ url  : chr "   http://example.com/api/v1/results"
  ..$ query:List of 3
  .. ..$ before: chr "4c1157e7"
  .. ..$ limit : num 50
  .. ..$ order : chr "desc"
 $ next    :List of 2
  ..$ url  : chr "   http://example.com/api/v1/results"
  ..$ query:List of 3
  .. ..$ after: chr "d583cd85"
  .. ..$ limit: num 50
  .. ..$ order: chr "desc"
 $ last    :List of 2
  ..$ url  : chr "   http://example.com/api/v1/results"
  ..$ query:List of 3
  .. ..$ after: chr "61d9bf14"
  .. ..$ limit: num 50
  .. ..$ order: chr "desc" 
```

## See Also
* [Link Header - W3C Wiki](https://www.w3.org/wiki/LinkHeader)
* [Traversing with Pagination - Github Developer](https://developer.github.com/guides/traversing-with-pagination/)
