library(ggplot2)

#Membaca data csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("penduduk_dki.csv")

#Masukan data ke dalam plot dan simpan sebagai variable plot.dki dan tampilkan summary dari plot tersebut 
plot.dki <- ggplot(data = penduduk.dki)
summary(plot.dki)