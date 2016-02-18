DataMerge <- function(num=num1, idx=idx1, stk=stk1){
  if(class(idx)!="character") stop("Input names of stocks as characters")
  if(class(stk)!="character") stop("Input names of index as characters")
  a <- read.csv(paste(idx,".csv",sep=""), header = TRUE)
  ddow <- as.Date(a$Date)
  pdow <- a$Adj.Close
  rdow <-(a$Adj.Close[-length(a$Adj.Close)]-a$Adj.Close[-1])/a$Adj.Close[-1]
  adow <- data.frame(ddow[-length(a$Date)],pdow[-length(a$Date)],rdow)
  names(adow) <- c("Date", paste("p",idx,sep=""), paste("r",idx,sep=""))
  total <- adow
  for(k in 1:num){
    a <- read.csv(paste(stk[k],".csv",sep=""), header = TRUE)
    d <- as.Date(a$Date)
    r <-(a$Adj.Close[-length(a$Adj.Close)]-a$Adj.Close[-1])/a$Adj.Close[-1]
    p <- a$Adj.Close
    a <- data.frame(d[-length(a$Date)],p[-length(a$Date)],r)
    names(a) <- c("Date", paste("p",k,sep=""), paste("r",k,sep=""))
    total <- merge(total, a, all=FALSE, sort=FALSE)
    }
  write.csv(total, "new_total.csv")
  save(total, file="new_total.RData")
}
