library(ggplot2)

#membaca data csv dan dimasukan ke variable penduduk.dki 
penduduk.dki <- read.csv("penduduk_dki.csv", sep = ",")

plot.dki <- ggplot(data = penduduk.dki, aes(x=LUAS.WILAYAH..KM2., 
                                            y=KEPADATAN..JIWA.KM2., color=NAMA.KABUPATEN.KOTA))
plot.dki