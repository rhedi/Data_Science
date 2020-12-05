library(ggplot2)

#Menambahkan data csv dan dimasukan kevariable penduduk.dki
penduduk.dki <- read.csv("datakependudukandki-dqlab.csv", sep = ",")

#Melakukan agregasi
aggregate(x=list(JUMLAH=penduduk.dki$JUMLAH), FUN=sum, by=list(NAMA.KABUPATEN.KOTA=penduduk.dki$NAMA.KABUPATEN.KOTA, JENIS.KELAMIN=penduduk.dki$JENIS.KELAMIN))
