test_that("parsing works", {

    should_be <- tibble::tibble(
        A = 1:6,
        Status = rep(c("Submitted", "Complete"), 3),
        Date = lubridate::ymd(rep(c("1900-01-31", "1902-10-31", "1904-02-29"),
                                  each = 2))
    )

    result <- parse_status_and_date(
        tibble::tribble(
            ~ A, ~ Chimera,
            1, "Foo\nSubmitted\nJan 1900",
            2, "Foo\nComplete\nJan 1900",
            3, "Bar\nSubmitted\nOct 3 1902",
            4, "Bar\nComplete\nOct 3 1902",
            5, "Baz\nSubmitted\nFeb 29 1904",
            6, "Baz\nComplete\nFeb 29 1904"
        ),
        "Chimera"
    )

    expect_equal(result$A, should_be$A)
    expect_equal(result$Status, should_be$Status)
    expect_equal(result$Date, should_be$Date)
})
