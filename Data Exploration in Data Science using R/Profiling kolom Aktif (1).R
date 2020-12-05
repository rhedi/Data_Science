library(RMySQL)

#Membuka Koneksi 
con <- dbConnect(MySQL(), user="root",  host="127.0.0.1", dbname="pelanggan")

#Konstruksi SQL
sql <- "SELECT pola_aktif, count(*) as jumlah_data FROM data_pelanggan GROUP BY pola_aktif"

#Mengirim Query
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#Mengambil data
profil_aktif <- fetch(rs, n=-1)
print(profil_aktif)

#Menutup koneksi
all_cons <- dbListConnections(MySQL())
for(con in all_cons) dbDisconnect(con)