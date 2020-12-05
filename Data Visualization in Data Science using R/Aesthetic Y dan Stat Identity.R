library(ggplot2)

#Membaca data csv dan dimasukan ke variable penduduk.dki
penduduk.dki <- read.csv("datakependudukandki-dqlab.csv", sep = ",")

#Menghasilkan Bar
plot.dki <- ggplot(data = penduduk.dki, aes(x=NAMA.KABUPATEN.KOTA, y=JUMLAH))

#Menambahkan layer pada plot 
plot.dki + geom_bar(stat = "identity")