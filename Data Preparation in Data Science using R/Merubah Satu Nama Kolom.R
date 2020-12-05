#Membaca dataset csv
penduduk.dki.csv <-read.csv("https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.csv", sep=",")

#Menggunakan names untuk merubah nama kolom di penduduk.dki,csv
names(penduduk.dki.csv)[1] <- "PERIODE"
names(penduduk.dki.csv)[2] <- "PROPINSI"
names(penduduk.dki.csv)