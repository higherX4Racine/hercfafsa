# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("school sheet names are found", {

    expect_equal(find_school_sheet(PATH_TO_WYOMING_2024),
                 "WY School Level Data")

    expect_equal(find_school_sheet(PATH_TO_JUNE_2020),
                 "School Level Data")
})
