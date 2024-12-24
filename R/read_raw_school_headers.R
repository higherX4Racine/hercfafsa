# Copyright (C) 2024 by Higher Expectations for Racine County

#' Look at headers about school-level counts of student FAFSA efforts
#'
#' @inheritParams read_raw_school_data
#'
#' @returns `<obj>` a tibble with five columns.
#' \describe{
#'   \item{Column}{`<int>` The index of the column of the header cell}
#'   \item{Row1}{`<chr>` Mostly empty with a verbose first cell}
#'   \item{Row2}{`<chr>` Sparse, but reports which Cycle each column belongs to}
#'   \item{Row3}{`<chr>` Redundant with Row4, basically just date}
#'   \item{Row4}{`<chr>` Column headings, the later ones are wide, not tidy}
#' }
read_raw_school_headers <- function(.fn, .sheet) {

    smeltr::extract_headers_from_sheet(
        .fn,
        .sheet = .sheet,
        .nrows = 4
    )

}
