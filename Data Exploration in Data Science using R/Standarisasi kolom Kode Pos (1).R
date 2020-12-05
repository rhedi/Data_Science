library(RMySQL)

#Membuka koneksi
con <- dbConnect(MySQL(), user="demo", password="demo", host="mysqlhost", dbname="dqlabdatawrangling")

#konstruksi SQL
sql <- "SELECT kode_pelanggan, kode_pos, pola_kode_pos FROM dqlab_messy_data WHERE pola_kode_pos in ('99999A', '9999A9')"

#Mengirimkan Query
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#Mengambil Data
data_kode_pos <- fetch(rs, n=-1)

#Merubah nilai O dan I 
data_kode_pos$kode_pos <- gsub("O", "0", data_kode_pos$kode_pos)
data_kode_pos$kode_pos <- gsub("I", "1", data_kode_pos$kode_pos)
print(data_kode_pos)

#Clear Resultset
dbClearResult(rs)

#Tutup Koneksi 
all_cons <- dbListConnections(MySQL())
for(con in all_cons) dbDisconnect(co)