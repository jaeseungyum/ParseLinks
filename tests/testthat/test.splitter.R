context("splitter")

test_that("splitter splits a text string by comma then returns a character vector", {
            expect_equal(splitter('<alabla>; rel="meta"')
                         ,  c('<alabla>; rel="meta"'))
            expect_equal(splitter('<alabla>; rel="meta", <blabla>; rel="next"')
                         ,  c('<alabla>; rel="meta"', '<blabla>; rel="next"'))
})
