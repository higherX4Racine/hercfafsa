# Copyright (C) 2024 by Higher Expectations for Racine County

#' Import data about FAFSA applications at specific schools
#'
#' @param .fn `<chr>` the full path to the FAFSA report spreadsheet
#'
#' @returns `<obj>` a tibble with seven or eight columns
#' \describe{
#'   \item{School Code}{`<chr>` the numeric code of the school, only in later years}
#'   \item{Name}{`<chr>` the name of the school}
#'   \item{City}{`<chr>` the municipality where the school is located}
#'   \item{State}{`<chr>` the state where the school is located}
#'   \item{Cycle}{`<chr>` which FAFSA cycle the data are part of}
#'   \item{Status}{`<chr>` either "Submitted" or "Complete"}
#'   \item{Date}{`<date>` the end of the month the data correspond to}
#'   \item{Applications}{`<int>` the number of applications}
#' }
#' @export
read_school_data <- function(.fn) {
    .sheet <- find_school_sheet(.fn)

    .headers <- .fn |>
        read_raw_school_headers(.sheet) |>
        wrangle_school_headers()

    .fn |>
        read_raw_school_data(.sheet) |>
        wrangle_school_data(.headers)
}
