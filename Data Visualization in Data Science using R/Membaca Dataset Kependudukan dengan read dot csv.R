library(ggplot2)

#Membaca data csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.csv", sep = ",")

#Tampilkan data frame dari kolom "NAMA.KELURAHAN" dan "LUAS.WILAYAH..KM@."
penduduk.dki[c("NAMA.KELURAHAN", "LUAS.WILAYAH..KM2.")]