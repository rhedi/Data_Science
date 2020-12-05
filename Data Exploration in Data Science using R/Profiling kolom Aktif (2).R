library(RMySQL)

#Membuk Koneksiq
con <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Konstruksi SQL
s <- "SELECT aktif, pola_aktif, count(*) as jumlah_data from data_pelanggan GROUP BY aktif, pola_aktif"

#Mengirim Query
send <- tryCatch(dbSendQuery(con, s), finally = print("Query Ok"))

#Mengambil data 
profil_aktif <- fetch(send, n=-1)
print(profil_aktif)

#Clear Result
#dbClearResult(send)

#Menutup Koneksi
ttp <- dbListConnections(MySQL())
for(con in ttp) dbDisconnect(con)