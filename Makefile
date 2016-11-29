test:
	R --quiet -e "devtools::test()"
	R --quiet -e "devtools::check()"
