library(ggplot2)

#Menambahkan data csv dan di masukan ke variable inflasi.indo.sing
inflasi.indo.sing <- read.csv("inflasi.csv", sep = ",")

#Mengurutkan nama bulan di sumbu x 
inflasi.indo.sing$Bulan <- factor(inflasi.indo.sing$Bulan, 
                                  levels = c("Jan-2017", "Feb-2017","Mar-2017","Apr-2017","May-2017",
                                            "Jun-2017","Jul-2017","Aug-2017","Sep-2017","Oct-2017"))

#Menambahkan data dan aesthetic mapping
plot.inflasi <- ggplot(data = inflasi.indo.sing, aes(x=Bulan, y=Inflasi, color=Negara, group=Negara))

#Menambahkan layer dan labels
plot.inflasi + geom_line() + geom_text(aes(label=Inflasi), hjust=-0.2, vjust=-0.5)
