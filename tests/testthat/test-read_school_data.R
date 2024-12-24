# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("wyoming '24 reads correctly", {

    why <- read_school_data(PATH_TO_WYOMING_2024)

    expect_equal(
        names(why),
        c("School Code",
          "Name",
          "City",
          "State",
          "Cycle",
          "Date",
          "Status",
          "Applications"
        )
    )

    expect_equal(nrow(why), 641)
})

test_that("June '20 reads correctly", {

    mmxx <- read_school_data(PATH_TO_JUNE_2020)

    expect_equal(
        names(mmxx),
        c("Name",
          "City",
          "State",
          "Cycle",
          "Date",
          "Status",
          "Applications"
        )
    )

    expect_equal(nrow(mmxx), 2250)
})
