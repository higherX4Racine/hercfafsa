# Copyright (C) 2024 by Higher Expectations for Racine County

#' Use a file's header data to wrangle its wide data into tidy format
#'
#' @param .wide_data `<obj>` output from [read_raw_school_data()]
#' @param .header_info `<obj>` output from [read_raw_school_headers()]
#'
#' @returns `<obj>` a tibble with seven or eight columns
#' \describe{
#'   \item{School Code}{`<chr>` the numeric code of the school, only in later years}
#'   \item{Name}{`<chr>` the name of the school}
#'   \item{City}{`<chr>` the municipality where the school is located}
#'   \item{State}{`<chr>` the state where the school is located}
#'   \item{Cycle}{`<chr>` which FAFSA cycle the data are part of}
#'   \item{Date}{`<date>` the end of the month the data correspond to}
#'   \item{Status}{`<chr>` either "Submitted" or "Complete"}
#'   \item{Applications}{`<int>` the number of applications}
#' }
wrangle_school_data <- function(.wide_data, .header_info) {
    .wide_data |>
        tidyr::pivot_longer(
            cols = tidyselect::starts_with("Applications"),
            names_to = "Row4",
            values_to = "Applications"
        ) |>
        dplyr::inner_join(
            .header_info,
            by = "Row4"
        ) |>
        dplyr::mutate(
            Applications = as.integer(.data$Applications)
        ) |>
        dplyr::filter(
            !is.na(.data$Applications)
        ) |>
        dplyr::select(
            tidyselect::any_of(c("School Code",
                                 "Name",
                                 "City",
                                 "State",
                                 "Cycle",
                                 "Date",
                                 "Status",
                                 "Applications"
            ))
        )
}
