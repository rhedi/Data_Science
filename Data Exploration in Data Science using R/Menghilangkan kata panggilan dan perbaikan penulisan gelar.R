library(RMySQL)
#Membuka koneksi
con <- dbConnect(MySQL(), user="demo", password="demo", host="mysqlhost",
                 dbname="dqlabdatawrangling")

#Konstruksi SQL
sql <- "SELECT kode_pelanggan, nama from dqlab_messy_data where nama like '%ibu%' or nama like '%bapak%'"

#Mengirimkan query
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#Mengambil data
data.pelanggan <- fetch(rs, n=-1)
data.pelanggan
data.pelanggan$nama <- gsub("[^A-Za-z .,]", "", data.pelanggan$nama)
data.pelanggan$nama <- gsub("\\bbapak\\b", "",data.pelanggan$nama, ignore.case=TRUE)
data.pelanggan$nama <- gsub("\\bibu\\b", "",data.pelanggan$nama, ignore.case=TRUE)
data.pelanggan$nama <- gsub("\\bir\\b", "Ir",data.pelanggan$nama, ignore.case=TRUE)
data.pelanggan$nama <- gsub("[ ]{2,}", " ", data.pelanggan$nama)
data.pelanggan$nama <- trimws(data.pelanggan$nama, which="both")
data.pelanggan

#Menutup Koneksi
all_cons <- dbListConnections(MySQL())
for(con in all_cons) dbDisconnect(con)