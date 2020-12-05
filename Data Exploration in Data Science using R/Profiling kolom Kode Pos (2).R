library(RMySQL)

#Membuka Koneksi 
con <- dbConnect(MySQL(), user="demo", password="demo", host="mysqlhost", dbname="dqlabdatawarling")

#Konstruksi SQL
sql <- "SELECT kode_pelanggan, kode_pos, pola_kode_pos from dqlab_messy_data WHERE pola_kode_pos in ('99999A', '9999A9')"

#Mengirimkan Query 
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#MEngambil Data
data_kode_pos <- fetch(rs, n=-1)
print(data_kode_pos)

#Clear Resulset
dbClearResult(rs)

#Menutup Koneksi
all_cons <- dbListConnections(MySQL())
for(con in all_cons) dbDisconnect(con)
