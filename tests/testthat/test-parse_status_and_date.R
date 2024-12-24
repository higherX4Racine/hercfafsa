test_that("parsing works", {

    should_be <- FIXTURE_RAW_SCHOOL_HEADER |>
        dplyr::bind_cols(
            tibble::tibble(
                Status = rep(c("Submitted", "Complete"), 3),
                Date = lubridate::ymd(rep(c("1900-01-31",
                                            "1902-10-31",
                                            "1904-02-29"),
                                          each = 2)),
                Year = rep(c("1900", "1902", "1904"), each = 2),
                Month = rep(c("Jan", "Oct", "Feb"), each = 2)
            )
        )

    result <- parse_status_and_date(FIXTURE_RAW_SCHOOL_HEADER, "Row4")

    expect_equal(
        names(result),
        c("Column",
          "Row2",
          "Status",
          "Month",
          "Year",
          "Row4",
          "Date")
    )

    purrr::walk(
        names(result),
        \(.) expect_equal(result[[.]], should_be[[.]])
    )
})
