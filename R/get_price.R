#' @title Function to download stocks closing price
#'
#' @description This function is designed to download the last closing prices and a selected closing prices in the past of a list of companies.
#'
#' @param tck list of companies tickers
#' @param tm number of days of the range
#'
#' 
#'
#' @example GetInfoPrices(c('AAPL', 'CRM', 'FTCH'), 30)
#' @example tickers <- c('FB', 'AMD', 'NVDA', 'CTSH', 'ZUO', 'BYND')
#'
#' GetInfoPrices(tickers, 20)
#'
#' @export 

GetInfoPrices <- function(tck, tm) {

  GetPrice <- function(tck, tm) {
    fd <- Sys.Date() - tm
    ld <- Sys.Date()

    stocks <- BatchGetSymbols(tickers = tck,
                              first.date = fd,
                              last.date = ld)
    return(stocks$df.tickers[,c(8,4,7)])
  }

  prices <- data.frame(id = character(0), first_price = numeric(0), last_price = numeric(0), stringsAsFactors=FALSE)

  for (i in tck) {
    ede <- GetPrice(tck, 30)
    first <- ede[ede$ticker == i,][1,2]
    last <- ede[ede$ticker == i,][sum(complete.cases(ede[ede$ticker == i,])),2]
    prices[nrow(prices) + 1,] = c(i, first, last)
  }
  return(prices)
}
