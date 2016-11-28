context("query_composer")

test_that("a query composer can parser query parameters in string then organizes a list consist of query parameter", {
            expect_equal(query_composer("limit=50&order=desc&user=yum")
                         , list(limit = 50
                                , order = "desc"
                                , user = "yum")) 
})
