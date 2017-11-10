#' Extract duplicate rows
#' @description Extract all rows with duplicated values in the given columns
#' @importFrom magrittr "%>%"
#' @param ... Columns to evaluation for duplication. Works via \code{group_by()}.
#' @return Filtered dataframe with duplicates in given columns
#' @examples
#' mtcars %>% duplicates(mpg)
duplicates <- function(data, ...) {
  data %>%
    group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    filter(n() > 1) %>%
    arrange_(.dots = lazyeval::lazy_dots(...))
}