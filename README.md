# 84bf8733
<hr/>
The aim of this project is to give a tool to catch overreactions on stock market, using function to get performances on a selected period, visualize the trend and read news about each stock.

## Installation

'''{r}
# install the R package 'devtools' if not installed
devtools::install_github('unimi-dse/84bf8733')
'''

## Usage
<hr/>

'''{r}
# load the package
require(OverreactionCatcher)
'''

## Function
<hr/>

* GetInfoPrices()
Function to download stocks closing price
'''{r}
GetInfoPrices(tck, tm)
'''

* GetPerformance()
Function to get performance and filter the data based on that.
'''{r}
GetPerformance(data, percentage)
'''

* get_articles()
Get news titles on a specific company from Google News
'''{r}
get_articles(company_name, n = 5)
'''
* PlotCompanies()
Plot stocks that require more interest
'''{r}
PlotCompanies(tck, years)
'''

## Author
* **Simone Giachetta** 
