library(ggplot2)

#Membaca data csv dan dimasukan ke variable penduduk.dki
penduduk.dki <- read.csv("https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.csv", sep = ",")

#Menambahkan data dan aesthetic mapping 
plot.dki <- ggplot(data = penduduk.dki, aes(x=LUAS.WILAYAH..KM2., y=KEPADATAN..JIWA.KM2., color=NAMA.KABUPATEN.KOTA))

plot.dki + geom_point()