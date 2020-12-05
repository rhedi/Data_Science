library(RMySQL)

#Membuka Koneksi
con <- dbConnect(MySQL(), user="demo", password="demo", host="mysqlhost", dbname="dqlabdatawrangling")

#konstruksi SQL
sql <- "SELECT pola_kode_pos, length(pola_kode_pos) as panjang_text, count(*) as jumlah_data FROM dqlab_messy_data 
GROUP BY pola_kode_pos"

#Mengirimkan Query 
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#Memeanggil Data
profil_kode_pos <- fetch(rs, n=-1)
print(profil_kode_pos)

dbClearResult(rs)

#Menutup Koneksi
all_cons <- dbListConnections(MySQL())
for (con in all_cons) dbDisconnect(con)