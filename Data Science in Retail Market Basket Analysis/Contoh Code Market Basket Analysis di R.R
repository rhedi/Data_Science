#MEnggunakan Library Arules
library(arules)

#Membaca transaksi dari file data_transaksi.txt
transaksi <- read.transactions(file = "https://academy.dqlab.id/dataset/data_transaksi.txt", format = "single", 
                               sep = "\t", cols = c(1,2), skip = 1)

#menampilkan data transaksi dengan print dan inspect 
inspect(transaksi)

#Menghasilkan model Market Basket Analysis
mba <- apriori(transaksi, parameter = list(supp = 0.1, confidence = 0.5))

#Menampilkan paket produk
inspect(subset(mba, lift>1))
