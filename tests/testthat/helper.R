PATH_TO_WYOMING_2024 <- system.file("extdata",
                                    "WY_Class_of_2024.xls",
                                    package = "hercfafsa")

PATH_TO_JUNE_2020 <- system.file("extdata",
                                 "HS_ARCHIVE06302020_excerpt.xls",
                                 package = "hercfafsa")

FIXTURE_RAW_SCHOOL_HEADER <- tibble::tribble(
    ~ Column, ~ Row2,             ~ Row4,
    1,        "1900/ 1901 Cycle", "Foo\nSubmitted\nJan 1900",
    2,        NA,                 "Foo\nComplete\nJan 1900",
    3,        "1902/ 1903 Cycle", "Bar\nSubmitted\nOct 3 1902",
    4,        NA,                 "Bar\nComplete\nOct 3 1902",
    5,        NA,                 "Baz\nSubmitted\nFeb 29 1904",
    6,        NA,                 "Baz\nComplete\nFeb 29 1904"
)
