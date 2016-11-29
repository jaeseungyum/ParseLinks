context("parse_links")

test_that("the function can parse a link header and return a list keyed by rel properties that contains information about each link", {
            expect_equal(parse_links('<alabla2>; rel="prev"')
                         , list(prev = list(url = "alabla2")))
            expect_equal(parse_links('<alabla>; rel="meta", <alabla2>; rel="prev"')
                         , list(meta = list(url = "alabla")
                                ,prev = list(url = "alabla2")))
            expect_equal(parse_links('<alabla?limit=50>; rel="meta"')
                         , list(meta = list(url = "alabla"
                                            , query = list(limit = 50))))
            expect_equal(parse_links('<alabla?limit=50&order=desc>; rel="meta", <alabla2?limit=100&order=asc>; rel="prev", <blabla>; rel="last"')
                         , list(meta = list(url = "alabla"
                                            , query = list(limit = 50
                                                           , order = "desc"))
                         , prev = list(url = "alabla2"
                                       , query = list(limit = 100
                                                      , order = "asc"))
                         , last = list(url = "blabla")))
}) 
