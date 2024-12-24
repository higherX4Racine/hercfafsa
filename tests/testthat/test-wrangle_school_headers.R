# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("raw school headers are wrangled correctly", {

    should_be = tibble::tibble(
      Cycle = c(rep("1900/ 1901", 2), rep("1902/ 1903", 4)),
      Status = rep(c("Submitted", "Complete"), 3),
      Date = lubridate::ymd(rep(c("1900-01-31", "1902-10-31", "1904-02-29"),
                                each = 2)),
      Row4 = FIXTURE_RAW_SCHOOL_HEADER$Row4
  )

  result <- wrangle_school_headers(FIXTURE_RAW_SCHOOL_HEADER)

  expect_equal(names(result), c("Cycle", "Row4", "Date", "Status"))
  expect_equal(result$Cycle, should_be$Cycle)
  expect_equal(result$Row4, should_be$Row4)
  expect_equal(result$Status, should_be$Status)
  expect_equal(result$Date, should_be$Date)
})
