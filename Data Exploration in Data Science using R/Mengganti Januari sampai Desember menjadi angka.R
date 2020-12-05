library(RMySQL)

#Membuka Koneksi
con <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Konstruksi SQL
s <- "SELECT tanggal_lahir from data_pelanggan where tanggal_lahir regexp '[a-z]'"

#MEngirim Query 
send <- tryCatch(dbSendQuery(con, s), finally = print("Query Ok"))

#Mengambil data 
data.pelanggan <- fetch(send, n=-1)

#Clear Result 
dbClearResult(send)

#Menghilangkan spasi 
data.pelanggan$tanggal_lahir <- gsub(" ", "", data.pelanggan$tanggal_lahir)

#Melakukan standarisasi nama bulan ke angka bulan
data.pelanggan$tanggal_lahir <- gsub("Januari", "-01-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("Februari", "-02-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("Maret", "-03-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("April", "-04-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("Mei", "-05-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("Juni", "-06-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("Juli", "-07-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("Agustus", "-08-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("September", "-09-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("Oktober", "-10-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("November", "-11-", data.pelanggan$tanggal_lahir)
data.pelanggan$tanggal_lahir <- gsub("Desember", "-12-", data.pelanggan$tanggal_lahir)
data.pelanggan

#Menutup Koneksi 
ttp <- dbListConnections(MySQL())
for(con in ttp) dbDisconnect(con)