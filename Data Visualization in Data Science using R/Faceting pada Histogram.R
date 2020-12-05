library(ggplot2)

#Menambahkan DATa csv dan dimasukan kevariable penduduk.dki
penduduk.dki <- read.csv("datakependudukandki-dqlab.csv", sep = ",")

#menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data = penduduk.dki, aes(x=KEPADATAN..JIWA.KM2., fill=NAMA.KABUPATEN.KOTA))


#Menambahkan Layer
plot.dki <- plot.dki + geom_histogram(binwidth = 10000)
plot.dki <- plot.dki + labs(x="Kepadatan Jiwa (km2)", y="Jumlah kelurahaan", color="Kabupaten/Kota")
plot.dki + facet_wrap(~NAMA.KABUPATEN.KOTA, ncol = 2)