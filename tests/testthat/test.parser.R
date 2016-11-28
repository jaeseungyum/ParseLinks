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

test_that("parser can parse query parameters in a link header", {
            expect_equal(parser('<alabla?limit=50>; rel="meta"')
                         , list(meta = list(url = "alabla"
                                            , query = list(limit = 50))))
            expect_equal(parser('<alabla?limit=50&order=desc>; rel="meta", <alabla2?limit=100&order=asc>; rel="prev", <blabla>; rel="last"')
                         , list(meta = list(url = "alabla"
                                            , query = list(limit = 50
                                                           , order = "desc"))
                                , prev = list(url = "alabla2"
                                              , query = list(limit = 100
                                                             , order = "asc"))
                                , last = list(url = "blabla")))
})
