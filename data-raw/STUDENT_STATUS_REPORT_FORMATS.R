# Copyright (C) 2025 by Higher Expectations for Racine County

STUDENT_STATUS_REPORT_FORMATS <- "extdata" |>
    system.file(
        "STUDENT_STATUS_REPORT_FORMATS.csv",
        package = "hercfafsa"
    ) |>
    readr::read_csv(
    col_types = "c"
)

usethis::use_data(STUDENT_STATUS_REPORT_FORMATS, overwrite = TRUE)
