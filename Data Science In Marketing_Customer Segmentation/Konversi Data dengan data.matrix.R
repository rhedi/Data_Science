pelanggan <- read.csv("customer_segments.txt", sep = "\t")

pelanggan_matrix <- data.matrix(pelanggan[c("Jenis.Kelamin", "Profesi", "Tipe.Residen")])
pelanggan_matrix