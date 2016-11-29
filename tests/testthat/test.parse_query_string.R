context("parse_query_string")

test_that("the function parses a query string into an R list object", {
            expect_equal(parse_query_string("limit=50&order=desc&user=yum")
                         , list(limit = 50
                                , order = "desc"
                                , user = "yum")) 
})
