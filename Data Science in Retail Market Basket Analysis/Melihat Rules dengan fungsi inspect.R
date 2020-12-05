library(arules)

transaksi <- read.transactions("data_transaksi.txt", format = "single", sep = "\t", cols = c(1,2), skip = 1)

mba <- apriori(transaksi)

inspect(mba)