# Copyright (C) 2024 by Higher Expectations for Racince County

#' Identify the sheet in a FAFSA report that contains school-level data
#'
#' @param .fn `<chr>` the full path to a FAFSA report spreadsheet
#'
#' @returns `<chr>` the name of the sheet
find_school_sheet <- function(.fn) {
    .fn |>
        readxl::excel_sheets() |>
        stringr::str_subset(
            "School Level Data"
        )

}
