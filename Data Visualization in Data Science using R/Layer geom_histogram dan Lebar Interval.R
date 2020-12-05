library(ggplot2)

#Membaca data csv dan dimasukan kevariable penduduk.dki 
penduduk.dki <- read.csv("https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.csv", sep = ",")

#Menambahkan data aesthetic mapping 
plot.dki <- ggplot(data = penduduk.dki, aes(x=KEPADATAN..JIWA.KM2.))
plot.dki + geom_histogram(binwidth = 10000)