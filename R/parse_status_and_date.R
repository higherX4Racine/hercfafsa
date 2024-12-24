# Copyright (C) 2024 by Higher Expectations for Racine County

#' Split a column containing both FAFSA status and date information
#'
#' @param .x `<obj>` the data frame with a chimeric column
#' @param .chimera_column `<chr>` the name of the chimeric column
#'
#' @returns `<obj>` a tibble like `.x`, without `.chimera_column`,with two extra columns
#' \describe{
#'   \item{Status}{`<chr>` Either "Submitted" or "Complete"}
#'   \item{Date}{`<date>` When the counts end}
#' }
parse_status_and_date <- function(.x, .chimera_column) {
    .x |>
        tidyr::separate_wider_delim(
            cols = tidyselect::all_of(.chimera_column),
            delim = "\n",
            names = c(NA, "Status", "Date Text"),
            cols_remove = FALSE
        ) |>
        tidyr::separate_wider_regex(
            cols = "Date Text",
            patterns = c(Month = "[^\\d\\s]+",
                         "\\s*\\d*\\s+",
                         Year = "\\d+")
        ) |>
        dplyr::mutate(
            Status = stringr::str_squish(.data$Status),
            Date = lubridate::ym(paste(.data$Year, .data$Month)),
            Date = lubridate::make_date(lubridate::year(.data$Date),
                                        lubridate::month(.data$Date),
                                        lubridate::days_in_month(.data$Date))
        )
}
