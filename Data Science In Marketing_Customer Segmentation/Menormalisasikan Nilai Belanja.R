pelanggan <- read.csv("customer_segments.txt", sep = "\t")

pelanggan_matrix <- data.matrix(pelanggan[c("Jenis.Kelamin", "Profesi", "Tipe.Residen")])

pelanggan <- data.frame(pelanggan, pelanggan_matrix)

pelanggan$NilaiBelanjaSetahun <- pelanggan$NilaiBelanjaSetahun / 1000000

pelanggan$NilaiBelanjaSetahun