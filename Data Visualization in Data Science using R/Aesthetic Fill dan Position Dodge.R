library(ggplot2)

#MEnambahkan data csv dan dimasukan kedalam penduduk.dki
penduduk.dki <- read.csv("datakependudukandki-dqlab.csv", sep = ",")

#Baigan plot
plot.dki <- ggplot(data = penduduk.dki, aes(x=NAMA.KABUPATEN.KOTA, y=JUMLAH, fill=JENIS.KELAMIN))

#Bagian penambahan layer
plot.dki + geom_bar(stat = "identity", position = "dodge")