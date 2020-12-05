library(arules)

transaksi <- read.transactions("data_transaksi.txt", sep = "\t", format = "single", cols = c(1,2), skip = 1)

mba <- apriori(transaksi)

inspect(subset(mba, lhs %in% "Pet Food" | rhs %in% "Teh Celup"))
inspect(subset(mba, lhs %in% "Pet Food" & rhs %in% "Sirup"))