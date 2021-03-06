#'  Intra-Day Stock Price Data Sets
#'
#'
#' Stock prices in one minute resolution are recorded for Bank of America, Walmart, Disney, Chevron, IBM, Microsoft, CocaCola,
#' Exon mobile, McDonalds and Microsoft. The time period that the observations span is given in the column names of
#' each stock data. During each day, stock price values were recorded in one-minute intervals from 9:30 AM
#' to 4:00 PM EST. The columns display the day, and the rows display the time at which the stock price is recorded.
#'
#' @docType data
#' @name Stock
#'
#' @return Several Stock Price Data Sets:
#'\item{Walmart}{
#' Walmart Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{Disney}{
#' Disney Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{ExonMobile}{
#' Exon Mobile Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{IBM}{
#' IBM Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{CitiGroup}{
#' Citi Group Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{McDonalds}{
#' McDonalds Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{Microsoft}{
#' Microsoft Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{BankOfAmerica}{
#' Bank Of America Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{Chevron}{
#' Chevron Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'\item{CocaCola}{
#' Coca Cola Stock Price Data Set taken from 06/15/2006 to 04/02/2007
#'}
#'
#' @format An object of class \code{data.table} or \code{data.frame}.
#'
#' @keywords datasets
#'
#'
#' @source \href{https://www.google.com/finance}{Google Finance}
#'
#' @examples
#'  library(fda)
#'  # transform first 100 days of Chevron data into functional data object
#'  data = as.matrix(Stock$Chevron[,1:100])
#'  # First need to transform the data to obtain the log returns
#'  temp1=data
#'  for(j in c(1:dim(data)[1])){
#'   for(k in c(1:dim(data)[2])){
#'     data[j,k]=100*(log(temp1[j,k])-log(temp1[1,k]))
#'   }
#' }
#' # Transform the Log return data into functional data
#' #using 21 bspline basis functions on [0,1]
#' D=21
#' basis =  create.bspline.basis(rangeval = c(0, 1), nbasis = D)
#' Domain = seq(0, 1, length = nrow(data))
#' f_data = Data2fd(argvals = Domain , data, basisobj = basis)
#' plot(f_data)

"Stock"
