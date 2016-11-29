# LinkHeaderParseR

A simple link header parser for R.

## Quick Start
### installation
```r
> devtools::install_github("jsng/LinkHeaderParseR")
```
## Basic Usage
### `parse`
```r
library(LinkHeaderParseR)

link_header_txt <- 
  '<http://example.com/api/v1/results?before=aa33d3f8&limit=50&order=desc>; rel="first",
   <http://example.com/api/v1/results?before=4c1157e7&limit=50&order=desc>; rel="previous",
   <http://example.com/api/v1/results?after=d583cd85&limit=50&order=desc>; rel="next",
   <http://example.com/api/v1/results?after=61d9bf14&limit=50&order=desc>; rel="last"'

link_header <- LinkHeaderParserR::parse(link_header_txt)
```
### Results
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
