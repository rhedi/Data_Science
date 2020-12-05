library(RMySQL)
library(openxlsx)

#Membuka Koneksi 
con <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Konstruksi SQL
s <- "SELECT kode_pelanggan, nilai_belanja_setahun from data_pelanggan"

#Mengirim Query 
send <- tryCatch(dbSendQuery(con, s), finally = print("Query Ok"))

#Mengambil data
data.pelanggan <- fetch(send, m=-1)

#Clear Result 
dbClearResult(send)

#Melakukan konversi nilai_belanja_setahun menjadi numerik, karen sebelumnya disimpan dalam bentuk character
data.pelanggan$nilai_belanja_setahun <- as.numeric(data.pelanggan$nilai_belanja_setahun)
summary(data.pelanggan)

#Menghitung nilai tengah dengan function median dan disimpan dalam variable nilai_tengah
nilai_tengah <- median(data.pelanggan$nilai_belanja_setahun, na.rm = TRUE)

#Mengisi missing value dengan nilai tengah 
data.pelanggan$nilai_belanja_setahun[is.na(data.pelanggan$nilai_belanja_setahun)] <- nilai_tengah

#Melihat summary setelah missing value
summary(data.pelanggan)

#Menulis ke dalam file staging.enrichment.median.xlsx
write.xlsx(data.pelanggan, file = "staging.enrichment.median.xlsx")

#Menutup Koneksi 
ttp <- dbListConnections(MySQL())
for(con in ttp) dbDisconnect(con)