#' @title Get news titles on a specific company from Google News
#' @description Use this function to have a flash understanding on a certain company event. Its purpose it's to use it after having detected companies had a negative performance, and get some information about them.
#'
#' @param company_name name of the company you'd like to get news titles
#' @param n numbers of news titles to return, default is 5
#' @example get_articles('tesla', 10)
#' @example get_articles('stm', 15)
#'
#' @import rvest
#' @export
get_articles <- function(company_name ,n = 5) {

  url <- paste0('https://news.google.com/search?q=',company_name,'&hl=en-US&gl=US&ceid=US%3Aen')

  url <- utils::URLencode(url)

  res <- xml2::read_html(url) %>%
    rvest::html_nodes('div.xrnccd') %>%
    rvest::html_text()

  return(res[1:n])
}



