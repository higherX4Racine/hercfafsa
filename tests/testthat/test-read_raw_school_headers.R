# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("reading raw school headers goes as planned", {
  why <- read_raw_school_headers(PATH_TO_WYOMING_2024,
                                 "WY School Level Data")
  expect_equal(
      why$Column,
      1:12
  )
  purrr::iwalk(
      list(Column = 12,
           Row1 = 1,
           Row2 = 2,
           Row3 = 4,
           Row4 = 12),
      \(.v, .k) expect_equal(sum(!is.na(why[[.k]])), .v)
  )

  mmxx <- read_raw_school_headers(PATH_TO_JUNE_2020,
                                 "School Level Data")
  expect_equal(
      mmxx$Column,
      1:11
  )
  purrr::iwalk(
      list(Column = 11,
           Row1 = 1,
           Row2 = 2,
           Row3 = 4,
           Row4 = 11),
      \(.v, .k) expect_equal(sum(!is.na(mmxx[[.k]])), .v)
  )

})
