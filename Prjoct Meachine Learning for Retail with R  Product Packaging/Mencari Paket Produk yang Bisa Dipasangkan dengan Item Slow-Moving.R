# Sebagai contoh kita mengambil 2 item produk (yakni "Tas Makeup" dan "Baju Renang Pria Anak-anak") 
# yang stoknya masih banyak dan perlu dicari pasangan item untuk pemaketannya.
# 
# Selanjutnya mendapatkan kombinasi produk menggunakan fungsi apriori dengan kriteria:
#   
# Sama seperti kriteria sebelumnya
# Memiliki tingkat confidence minimal 0.1
# 
# Hint: Pada association rules, item "Tas Makeup" dan "Baju Renang Pria Anak-anak" tersebut kita masukkan 
# di rhs (right hand side).


library(arules)

transaksi <- read.transactions("transaksi_dqlab_retail.tsv", format = "single", sep = "\t", cols = c(1,2), skip = 1)

mba2 <- apriori(transaksi, parameter = list(supp = 10/length(transaksi), confidence = 0.1, minlen = 2, maxlen = 3))

mba_1 <- subset(mba2, rhs %in% "Tas Makeup")
mba_1 <- head(sort(mba_1, by="lift", decresing=TRUE), n=3)

#subset baju renang pria anak-anak
mba_2 <- subset(mba2, rhs %in% "Baju Renang Pria Anak-anak")
mba_2 <- head(sort(mba_2, by="lift", decresing=TRUE), n=3)

mba2 <- c(mba_1,mba_2)
#mba2
inspect(mba2)

write(mba2, file = "kombinasi_retail_slow_moving.txt", eol = "\r\n")


# Kesimpulan
# 
# Tas Makeup (item slow-moving) dapat dikombinasikan/dipaketkan dengan Baju Renang Anak Perempuan 
# dan Tas Pinggang Wanita.
# Baju Renang Pria Anak-anak (item slow-moving) dapat dikombinasikan/dipaketkan dengan Gembok Koper dan Tas Waist Bag.
# Dari rekomendasi paket produk tersebut, dapat disimpulkan bahwa target konsumen adalah Ibu Rumah Tangga.