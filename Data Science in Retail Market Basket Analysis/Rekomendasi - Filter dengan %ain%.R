library(arules)

transaksi <- read.transactions("data_transaksi.txt", sep = '\t', format = "single", cols = c(1,2), skip = 1)

mba <- apriori(transaksi, parameter = list(support = 0.1, confidence = 0.5))

inspect(subset(mba, (lhs %ain% c("Gula", "Pet Food"))))