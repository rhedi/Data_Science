library(openxlsx)

#Mempersiapkan Data
dataCreditRating <- read.xlsx(xlsxFile = "https://academy.dqlab.id/dataset/credit_scoring_dqlab.xlsx")

#Merubah tipe data clsass variable sebagai factor 
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating)
str(dataCreditRating)

#Menghilangkan beberapa variable input dari dataset 
input_columns <- c("durasi_pinjaman_bulan", "jumlah_tanggungan")
datafeed <- dataCreditRating[ , input_columns]
str(datafeed)