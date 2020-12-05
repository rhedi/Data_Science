library(ggplot2)

#Membaca data csv dan dimasukan ke variable penduduk.dki
penduduk.dki <- read.csv("https://dqlab.id/dataset/dkikepadatankelurahan2013.csv", sep = ",")

#Menambahkan data dan aesthetic mapping\
plot.dki <- ggplot(data = peduduk.dki, aes(x=LUAS.WILAYAH..KM2., y=KEPADATAN..JIWA.KM2., color=NAMA.KABUPATEN.KOTA))

#Menambahkan Layer dan labels
plot.dki + geom_point() + theme(plot.title = element_text(hjust = 0.5)) + 
  labs(title = "Luas Wilayah vs Kepadatan Penduduk DKI Jakarta", x="Luas Wilayah (KM2)", y="Kepadatan Jiwa per Km2", color="Nama Kabupaten/Kota")
