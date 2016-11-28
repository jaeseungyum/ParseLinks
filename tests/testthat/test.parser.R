context("parser")

test_that("parser can parse a link header into a meaningful list data", {
            expect_equal(parser('<alabla>; rel="meta"')
                         , list(meta = list(url = "alabla")))
            expect_equal(parser('<alabla2>; rel="prev"')
                         , list(prev = list(url = "alabla2")))
            expect_equal(parser('<alabla>; rel="meta", <alabla2>; rel="prev"')
                         , list(meta = list(url = "alabla")
                                ,prev = list(url = "alabla2")))
})
