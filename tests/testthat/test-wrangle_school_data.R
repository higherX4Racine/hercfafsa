test_that("wyoming 2024 data are wrangled", {
  headers <- PATH_TO_WYOMING_2024 |>
      read_raw_school_headers("WY School Level Data") |>
      wrangle_school_headers()

  result <- PATH_TO_WYOMING_2024 |>
      read_raw_school_data("WY School Level Data") |>
      wrangle_school_data(headers)

  expect_equal(
      names(result),
      c(
          "School Code",
          "Name",
          "City",
          "State",
          "Cycle",
          "Date",
          "Status",
          "Applications"
      )
  )

  expect_equal(nrow(result), 641)
})

test_that("june 2020 data are wrangled", {
    headers <- PATH_TO_JUNE_2020 |>
        read_raw_school_headers("School Level Data") |>
        wrangle_school_headers()

    result <- PATH_TO_JUNE_2020 |>
        read_raw_school_data("School Level Data") |>
        wrangle_school_data(headers)

    expect_equal(
        names(result),
        c(
            "Name",
            "City",
            "State",
            "Cycle",
            "Date",
            "Status",
            "Applications"
        )
    )
    expect_equal(nrow(result), 2250)
})
