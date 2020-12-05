library(RMySQL)
library(openxlsx)

#Membuka Koneksi 
con <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Konstruksi SQL
s <- "SELECT kode_pelanggan, nilai_belanja_setahun from data_pelanggan"

#MEngirim Query 
send <- tryCatch(dbSendQuery(con, s), finally = print("Query Ok"))

#Mengambil data
data.pelanggan <- fetch(send, n=-1)

#Clear Result
dbClearResult(send)

#Melakukan konversi nilai_belanja_setahun menjadi numerik, karena sebelumnya disimpan dalam bentuk character
data.pelanggan$nilai_belanja_setahun <- as.numeric(data.pelanggan$nilai_belanja_setahun)
summary(data.pelanggan)

#MEnghitung rata-rata dengan function mean dan disimpan dalam variable nilai rata-rata
nilai_rata_rata <- mean(data.pelanggan$nilai_belanja_setahun, na.rm = TRUE)

#Mengisi missing value dengan nilai rata_rata
data.pelanggan$nilai_belanja_setahun[is.na(data.pelanggan$nilai_belanja_setahun)] <- nilai_rata_rata

#Melihat summary setelah missing value
summary(data.pelanggan)

#Menulis ke dalam file staging.enrichment.mean.xlsx
write.xlsx(data.pelanggan, file = "staging.enrichment.mean.xlsx")

#Tutup Koneksi 
ttp <- dbListConnections(MySQL())
for(con in ttp) dbDisconnect(con)