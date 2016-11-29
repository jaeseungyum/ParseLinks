test:
	R --quiet -e "library(devtools); devtools::test()"
	R --quiet -e "library(devtools); devtools::check()"
