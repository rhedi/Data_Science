library(arules)

read.transactions("data_transaksi.txt", format = "single", sep = "\t", cols = c(1,2), skip=1)