# Copyright (C) 2024 by Higher Expectations for Racine County

#' Pull in school-level data from a FAFSA report
#'
#' @param .fn `<chr>` the full path to the report spreadsheet
#' @param .sheet `<chr>` the sheet in that file with school-level data
#'
#' @returns `<obj>` a data frame with a variable number of columns
read_raw_school_data <- function(.fn, .sheet) {
    .fn |>
        readxl::read_excel(
            sheet = .sheet,
            skip = 3,
            col_names = TRUE,
            na = c("", "<5")
        )
}
