library(RMySQL)
library(reshape2)

#MEmbuka koneksi
con <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Konstruksi SQL
s <- "SELECT tanggal_lahir from data_pelanggan where tanggal_lahir like '%/%'"

#Mengirim Query
send <- tryCatch(dbSendQuery(con, s), finally = print("Query Ok"))

#Mengambil data
data.pelanggan <- fetch(send, n=-1)

#Clear Result 
dbClearResult(send)

#Melakikan split dan menyimpan ke variabel tanggal.split dengan urutan bulan, hari dan tahun 
tanggal.split <- colsplit(data.pelanggan$tanggal_lahir, "/", c("bulan", "hari", "tahun"))

#MEmperbaiki data tahun dengan format satu dan dua digit angka dengan sapply 
tanggal.split$tahun <- sapply(tanggal.split$tahun, function(x) if(x>=0 & x<10) 
  2000 + x else if(x>=10 & x<100) 1900 + x else x)

#Menggabungkan kembali dalam urutan hari, bulan dan tahun dengan tanda seperator "-" dan menyimpannya kembali 
#ke data.pelanggan$tanggal_lahir

data.pelanggan$tanggal_lahir <- paste(tanggal.split$hari, tanggal.split$bulan, tanggal.split$tahun, sep="-")
data.pelanggan$tanggal_lahir

#Menutup Koneksi 
ttp <- dbListConnections(MySQL())
for(con in ttp) dbDisconnect(con)