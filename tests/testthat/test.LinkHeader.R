context("parser")

test_that("parser can parse a link header", {
            expect_equal(parser('<alabla>; rel="meta", <blabla>; rel="next"')
                         , list("meta" = list(url = "alabla")
                                , "next" = list(url = "blabla")))
})
