library(ggplot2)

#Membaca data csv dan dunasukan ke variable inflasi.indo.sing
inflasi.indo.sing <- read.csv("inflasi.csv" sep = ",")
inflasi.indo.sing

#Menambahkan data dan aesthetic mapping 
plot.inflasi <- ggplot(data = inflasi.indo.sing, aes(x=Bulan, y=Inflasi, color=Negara, group=Negara))

#Menambahkan layer
plot.inflasi + geom_line()