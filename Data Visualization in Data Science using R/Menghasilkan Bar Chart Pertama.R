library(ggplot2)

#Membaca data csv dan dimasukan ke variable penduduk.dki
penduduk.dki <- read.csv("datakependudukandki-dqlab.csv", sep = ",")

plot.dki <- ggplot(data = penduduk.dki, aes(x=NAMA.KABUPATEN.KOTA))
plot.dki + geom_bar()