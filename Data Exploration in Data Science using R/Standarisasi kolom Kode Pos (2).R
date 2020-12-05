library(RMySQL)
library(openxlsx)

#Membuka Koeneksi
con <- dbConnect(MySQL(), user="demo", password="demo", host="mysqlhost", dbname="dqlabdatawrangling")

#konstruksi SQL
sql <- "SELECT kode_pelanggan, kode_pos, pola_kode_pos from dqlab_messy_data"

#Mengirimmkan Query 
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#Mengambil data
data_kode_pos <- fetch(rs, n=-1)

#Merubah Nilai O menjadi 0 pada kolom kode_pos
data_kode_pos$kode_pos <- gsub("O", "0", data_kode_pos$kode_pos)
#Merubah nilai I menjadi 1 pada kolom kode_pos
data_kode_pos$kode_pos <- gsub("I", "1", data_kode_pos$kode_pos)
print(data_kode_pos)

#Menulis data ke file
write.xlsx(file="staging.kode_pos.xlsx", x=data_kode_pos)

#Clear Resultset
dbClearResult(rs)

#Menutup Koneksi 
all_cons <- dbListConnections(MySQL())
for(con in all_cons) dbDisconnect(con)