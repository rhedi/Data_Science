pelanggan <- read.csv("customer_segments.txt", sep = "\t")

pelanggan_matrix <- data.matrix(pelanggan[c("Jenis.Kelamin", "Profesi", "Tipe.Residen")])

#Penggabungan Data
pelanggan <- data.frame(pelanggan, pelanggan_matrix)

#Tampilkan kembali data hasil penggabungan
pelanggan