# Mendapatkan kombinasi produk yang menarik menggunakan fungsi apriori dengan kriteria:
#   
# Memiliki asosiasi atau hubungan erat.
# Kombinasi produk minimal 2 item, dan maksimum 3 item.
# Kombinasi produk itu muncul setidaknya 10 dari dari seluruh transaksi.
# Memiliki tingkat confidence minimal 50 persen.



library(arules)

transaksi <- read.transactions("transaksi_dqlab_retail.tsv", format = "single", sep = "\t", cols = c(1,2), skip = 1)


mba <- apriori(transaksi, parameter = list(supp = 10/length(transaksi), confidence = 0.5, minlen = 2, maxlen = 3))

mba <- head(sort(mba, decreasing = TRUE, by="lift"), n=10)

inspect(mba)

write(mba, file = "kombinasi_retail.txt")