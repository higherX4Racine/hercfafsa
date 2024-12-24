# Copyright (C) 2024 by Higher Expectations for Racine County

#' Convert raw header cells into a tidy table
#'
#' @param .raw_headers results from running [read_raw_school_headers()]
#'
#' @returns `<obj>` a tibble with three columns
#' \describe{
#'   \item{Cycle}{`<chr>` The FAFSA cycle that this column reports on}
#'   \item{Date}{`<date>` The date that this column corresponds to}
#'   \item{Status}{`<chr>` Either "Submitted" or "Complete"}
#' }
wrangle_school_headers <- function(.raw_headers){

    .raw_headers |>
        tidyr::fill(
            tidyselect::starts_with("Row"),
            .direction = "down"
        ) |>
        dplyr::filter(
            !is.na(.data$Row2)
        ) |>
        parse_status_and_date(
            "Row4"
        ) |>
        dplyr::mutate(
            Cycle = .data$Row2 |>
                stringr::str_extract(".*(?=Cycle)") |>
                stringr::str_squish()
        ) |>
        dplyr::select(
            "Cycle",
            "Row4",
            "Date",
            "Status"
        )
}
