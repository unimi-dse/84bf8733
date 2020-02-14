#' @title Function to get performance and filter the data based on that.
#'
#' @description The purpose of this function is to filter stocks based on performance. Given a certain percentage, the function return all the stocks that performed less than that percentage.
#'
#' @param data dataframe resulting from the get_price function.
#' @param percentage treshold to filter stocks. The function return all the stocks that perform less than the given percentage.
#'
#'@example tickers <- c('FB', 'AMD', 'NVDA', 'CTSH', 'ZUO', 'BYND', 'BA')
#'
#' companies  <- GetInfoPrices(tickers, 20)
#'
#' GetPerformance(companies, 0)
#'
#' @export 



GetPerformance <- function(data, percentage) {
  data$performance <- round((as.numeric(data$last_price) / as.numeric(data$first_price) - 1) * 100, digits = 2)
  result <- filter(data, performance < percentage)
  return(result)
}
