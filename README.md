# yahoo-stock-data-mgmt
Merging stock data from yahoo finance

To use this function, download daily/monthly stock price data from Yahoo Finance
and save them into your working directory as *.csv (where * is the name
of the file). This function can easily merge data into usable data frames to be
called out by R. The command for this function is DataMerge() and once run,
the function will spit out a total.Rdata file and a total.csv file in the working
directory you previously specified. Make sure to download both Stock data and
Index data (if Single Index Model is to be used. See next section). For example,
in our case, we type:

DataMerge(num=30,idx="dji",stk=c("aa","axp","ba","bac","cat","csco","cvx",
"dd","dis","ge","hd","hpq","ibm","intc","jnj","jpm","kft","ko","mcd","mmm",
"mrk","msft","pfe","pg","t","trv","utx","vz","wmt","xom"))

where num is the number of stocks in the portfolio, idx is the name of the index
we are using, and stk is the character string of the names of the stock *.csv files
downloaded from Yahoo
