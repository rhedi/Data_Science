library(RMySQL)
library(openxlsx)

#Membuka Koneksi
con <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Knstruksi SQL
s <- "SELECT kode_pelanggan, aktif, pola_aktif from data_pelanggan"

#Mengrim Query
send <- tryCatch(dbSendQuery(con, s), finally = print("Query Ok"))

#Mendaptkan data
data_aktif <- fetch(send, n=-1)
data_aktif$aktif <- gsub("I", "1", data_aktif$aktif)
data_aktif$aktif <- gsub("O", "0", data_aktif$aktif)
data_aktif$aktif <- gsub("TRUE", "1", data_aktif$aktif)
data_aktif$aktif <- gsub("FALSE", "0", data_aktif$aktif)
print(data_aktif)

#Mennulis output ke file excel
write.xlsx(file = "staging.aktif.xlsx", x=data_aktif)

#Menutup Koneksi
ttp <- dbListConnections(MySQL())
for(con in ttp) dbDisconnect(con)