library(RMySQL)
library(reshape2)

#Membuka Koneksi 
con <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Konstruksi SQL
s <- "SELECT tanggal_lahir from data_pelanggan where tanggal_lahir like '%/%' "

#Mengirim Query
send <- tryCatch(dbSendQuery(con, s), finally = print("Query Ok"))

#mengambil data
data.pelanggan <- fetch(send, n=-1)

#Clear Result
dbClearResult(send)

#Melakukan split dan menyimpan ke variabel tanggal.split dengan urutan bulan, hari, tahun
tanggal.split <- colsplit(data.pelanggan$tanggal_lahir, "/", c("bulan", "hari", "tahun"))

#menggabungkan kembali dalam urutan hari, bulan dan tahun dan menyimpannya kembali ke data.pelanggan$tanggal_lahir
data.pelanggan$tanggal_lahir <- paste(tanggal.split$hari, tanggal.split$bulan, tanggal.split$tahun, sep="-")
data.pelanggan$tanggal_lahir

#Menutup Koneksi 
ttp <- dbListConnections(MySQL())
for(con in ttp) dbDisconnect(con)