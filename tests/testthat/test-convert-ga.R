context("Convert Core Reporting API response")

ga_data <- structure(list(
    kind = "analytics#gaData",
    total.results = 8L, contains.sampled.data = FALSE,
    column.headers = structure(list(
        name = c("ga:date", "ga:users", "ga:sessions", "ga:pageviews"),
        column.type = c("DIMENSION", "METRIC", "METRIC", "METRIC"),
        data.type = c("STRING", "INTEGER", "INTEGER", "INTEGER")),
        .Names = c("name", "column.type", "data.type"),
        class = "data.frame",
        row.names = c(NA, 4L)),
    rows = structure(c(
        "20150103", "20150104", "20150105", "20150106",
        "20150107", "20150108", "20150109", "20150110", "1350", "1558",
        "1761", "1628", "1861", "2265", "2462", "413", "1704", "1939",
        "2159", "2038", "2345", "2866", "3066", "462", "4045", "4557",
        "4856", "5024", "5791", "7134", "7381", "1167"),
        .Dim = c(8L, 4L))),
    .Names = c("kind", "total.results", "contains.sampled.data", "column.headers", "rows"))

ga_df <- build_df(ga_data)

test_that("Result class", {
    expect_is(ga_df, "data.frame")
})

test_that("Data frame dimensions", {
    expect_equal(ncol(ga_df), 4L)
    expect_equal(nrow(ga_df), 8L)
})

test_that("Columns types", {
    expect_true(all(sapply(ga_df, is.integer)))
})
