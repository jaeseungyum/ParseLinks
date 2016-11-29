test:
	Rscript -e 'devtools::test()'

check:
	Rscript -e 'devtools::check()'

document:
	Rscript -e 'devtools::document()'

build:
	Rscript -e 'devtools::build()'
