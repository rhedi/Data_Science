#Load library stringdist
library(stringdist)

#Membuat variabel referensi dan vector nama 
referensi <- "Agus Cahyono"
nama.pelanggan <- c("Agus Cahyono", "Justin Bieber", "Agus Tjahyono", "Cahyono Agus")

#Menghitung jarak referensi dengan vector nama 
jarak.teks <- stringdist(referensi, nama.pelanggan, method = "cosine")

#Menampilkan variable jarak.teks 
jarak.teks

#Data nama pelanggan yang telah difilter dengan thresold 0.15
nama.pelanggan[jarak.teks <= 0.15]
