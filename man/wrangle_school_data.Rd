% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrangle_school_data.R
\name{wrangle_school_data}
\alias{wrangle_school_data}
\title{Use a file's header data to wrangle its wide data into tidy format}
\usage{
wrangle_school_data(.wide_data, .header_info)
}
\arguments{
\item{.wide_data}{`<obj>` output from [read_raw_school_data()]}

\item{.header_info}{`<obj>` output from [read_raw_school_headers()]}
}
\value{
`<obj>` a tibble with seven or eight columns
\describe{
  \item{School Code}{`<chr>` the numeric code of the school, only in later years}
  \item{Name}{`<chr>` the name of the school}
  \item{City}{`<chr>` the municipality where the school is located}
  \item{State}{`<chr>` the state where the school is located}
  \item{Cycle}{`<chr>` which FAFSA cycle the data are part of}
  \item{Date}{`<date>` the end of the month the data correspond to}
  \item{Status}{`<chr>` either "Submitted" or "Complete"}
  \item{Applications}{`<int>` the number of applications}
}
}
\description{
Use a file's header data to wrangle its wide data into tidy format
}
