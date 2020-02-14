#' @title Plot stocks that require more interest
#'
#' @description This function return plot for each companies selected. It's helpful to get a larger view of the stocks trend.
#'
#' @param tck list of the stocks tickers
#' @param years number of years to visualize
#'
#' @example tickers <- c('FB', 'AMD', 'NVDA', 'CTSH', 'ZUO', 'BYND', 'BA')
#' PlotCompanies(tickers, 5)
#' @export

PlotCompanies <- function(tck, years) {
  companies <- BatchGetSymbols(tck, first.date = Sys.Date() - (365*years), last.date = Sys.Date(), thresh.bad.data = 0.5)
  plt <- ggplot(companies$df.tickers, aes(x = ref.date, y = price.close))
  plt <- plt + geom_line()
  plt <- plt + facet_wrap(~ticker, scales = 'free_y')
  return(p)
}
