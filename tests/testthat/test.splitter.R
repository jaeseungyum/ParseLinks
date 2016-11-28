context("splitter")

test_that("splitter can split a link header text into url / rel groups", {
            expect_equal(splitter('<alabla>; rel="meta"')
                         ,  c('<alabla>; rel="meta"'))
            expect_equal(splitter('<alabla>; rel="meta", <blabla>; rel="next"')
                         ,  c('<alabla>; rel="meta"', '<blabla>; rel="next"'))
})
