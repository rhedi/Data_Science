library(arules)

transaksi <- read.transactions("data_transaksi.txt", sep = "\t", cols = c(1,2), format = "single", skip = 1)

transaksi@data

# Berikut adalah penjelasan hasilnya:
#   
#   4 x 10 :  artinya terdapat 4 item dan 10 transaksi.
# [1,] s/d [4,] : artinya index yang mewakili tiap item dalam transaksi. Index ini sebenarnya mencerminkan urutan dari hasil dari subbab "Menampilkan Daftar Item Transaksi" sebagai berikut:
#   
#   labels
# 1         Gula
# 2     Pet Food
# 3        Sirup
# 4    Teh Celup
# 
# dengan demikian, item Gula diwakili [1,], Pet Food diwakili [2,], dan seterusnya.
# Simbol tanda titik .  menunjukkan item tidak ada di transaksi.
# Simbol garis lurus |  menunjukkan bahwa item ada di transaksi.