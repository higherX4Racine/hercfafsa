# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("wyoming '24 reads raw", {

    why <- read_raw_school_data(PATH_TO_WYOMING_2024, "WY School Level Data")

    expect_equal(names(why),
                 c("School Code",
                      "Name",
                      "City",
                      "State",
                   c("Applications\nSubmitted\nDec13  2024"),
                   c("Applications\nComplete\nDec13  2024"),
                   c("Applications\nSubmitted\nDec13  2023"),
                   c("Applications\nComplete\nDec13  2023"),
                   c("Applications\nSubmitted\nJun  2023"),
                   c("Applications\nComplete\nJun  2023"),
                   c("Applications\nSubmitted\nDec  2023"),
                   c("Applications\nComplete\nDec  2023")
                 ))

    expect_equal(nrow(why), 87)
})

test_that("June '20 reads raw", {

    mmxx <- read_raw_school_data(PATH_TO_JUNE_2020, "School Level Data")

    expect_equal(names(mmxx),
                 c("Name",
                   "City",
                   "State",
                   c("Applications\nSubmitted\nJun30  2020"),
                   c("Applications\nComplete\nJun30  2020"),
                   c("Applications\nSubmitted\nJun30  2019"),
                   c("Applications\nComplete\nJun30  2019"),
                   c("Applications\nSubmitted\nJun  2019"),
                   c("Applications\nComplete\nJun  2019"),
                   c("Applications\nSubmitted\nDec  2019"),
                   c("Applications\nComplete\nDec  2019")
                 ))

    expect_equal(nrow(mmxx), 298)
})
