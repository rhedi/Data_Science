library(ggplot2)

#Penambahan judul dengan menggunakan fungsi labs
plot.jakarta <- ggplot()
plot.jakarta <- plot.jakarta + labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta - Periode 2013")
plot.jakarta <- plot.jakarta + labs(x="Luas Wilayah (km2)", y="Kepadatan Jiwa per km2")
plot.jakarta
summary(plot.jakarta)