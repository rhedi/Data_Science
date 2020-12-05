library(arules)

transaksi <- read.transactions("transaksi_dqlab_retail.tsv", sep = "\t", format = "single", cols = c(1,2), skip = 1)

data_item <- itemFrequency(transaksi, type = "absolute")

data_item <- sort(data_item, decreasing = TRUE)

data_item <- data_item[1:10]

data_item <- data.frame("Nama Produk" = names(data_item), "Jumlah" = data_item, row.names = NULL)

data_item
write.csv(data_item, file = "top10_item_retail.txt")