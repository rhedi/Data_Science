library(RMySQL)
#Membuka koneksi
con <- dbConnect(MySQL(), user="demo", password="demo", host="mysqlhost",
                 dbname="dqlabdatawrangling")

#Konstruksi SQL
sql <- "SELECT pola_no_telepon, length(pola_no_telepon) as panjang_text, count(*) as jumlah_data from dqlab_messy_data group by pola_no_telepon"

#Mengirimkan query
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#Mengambil data
profil_no_telepon <- fetch(rs, n=-1)
print(profil_no_telepon)

#Clear resultset
dbClearResult(rs)

#Menutup Koneksi
all_cons <- dbListConnections(MySQL())
for(con in all_cons) dbDisconnect(con)
