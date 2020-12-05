library(ggplot2)

#Membaca data csv dan dimasukan kevariable penduduk.dki
penduduk.dki <- read.csv("datakependudukandki-dqlab.csv", sep = ",")

#menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data = penduduk.dki, aes(x=LUAS.WILAYAH..KM2., y=KEPADATAN..JIWA.KM2., color=NAMA.KABUPATEN.KOTA))

#Menambakan layer
plot.dki <- plot.dki + layer(geom="point", stat = "identity", position = "identity")

plot.dki <- plot.dki + labs(x="Luas Wilayah (km2)", y="Kepadatan Jiwa (km2)", color="Kabupaten/Kota")

plot.dki + facet_wrap(~NAMA.KABUPATEN.KOTA, ncol = 2)