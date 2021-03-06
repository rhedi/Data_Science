library(openxlsx)
library(C50)

#Mempersiapkan Data
dataCreditRating <- read.xlsx(xlsxFile = "https://academy.dqlab.id/dataset/credit_scoring_dqlab.xlsx")

#MEmpersiapkan class dan input variables 
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating)
input_columns <- c("durasi_pinjaman_bulan", "jumlah_tanggungan")
datafeed <- dataCreditRating[, input_columns]

#Mempersiapkan training dan testing set 
set.seed(100) #Untuk menyeragamkan hasil random antar tiap komputer 
indeks_training_set <- sample(900, 800)

#Membuat dan menampilkan training set dan testing set 
input_training_set <- datafeed[indeks_training_set,]
class_training_set <- dataCreditRating[indeks_training_set,]$risk_rating
input_testing_set <- datafeed[-indeks_training_set]

#Menghasilkan dan menanpilkan summary model
risk_rating_model <- C5.0(input_training_set, class_training_set)

#Membuat data frame aplikasi baru 
aplikasi_baru <- data.frame(jumlah_tanggungan = 6, durasi_pinjaman_bulan = 64)

#Melakukan prediksi 
predict(risk_rating_model, aplikasi_baru)