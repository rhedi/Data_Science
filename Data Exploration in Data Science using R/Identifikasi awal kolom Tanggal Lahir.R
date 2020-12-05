library(RMySQL)

#Membuka Koneksi
cn <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Konstruksi SQL
s <- "SELECT tanggal_lahir from data_pelanggan where tanggal_lahir REGEXP '[A-Za-z]'"

#Mengirim Query 
send <- tryCatch(dbSendQuery(cn, s), finally = print("Query Ok"))

#Mengambil data 
data.pelanggan <- fetch(send, n=-1)

#Clear Result
dbClearResult(send)

#Menghapus karakter digit dan spasi dengan function gsub dan pola regex [0-9]
data.pelanggan$tanggal_lahir <- gsub("[0-9]","", data.pelanggan$tanggal_lahir)

#Melakukan grouping nama bulan dengan function unique
unique(data.pelanggan$tanggal_lahir)

#Menutup Koneksi 
ttp <- dbListConnections(MySQL())
for(cn in ttp) dbDisconnect(cn)