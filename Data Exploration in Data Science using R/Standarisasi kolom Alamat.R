library(RMySQL)
library(openxlsx)

#Membuka Koneksi 
con <- dbConnect(MySQL(), user="demo", password="demo", host="mysqlhost", dbname ="dqlabdatawrangling")

#Konstruksi SQL
sql <- "Select kode_pelanggan, alamat from dqlab_messy_data"

#Mengirimkan Query 
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#Mengambil data
data_alamat <- fetch(rs, n=-1)

#Merubah singkatan jl, jln, jl. dan jln. menjadi Jalan
data_alamat$alamat <- gsub("jln[ ]*\\.", "Jalan", data_alamat$alamat, ignore.case = TRUE)
data_alamat$alamat <- gsub("\\bjln\\b", "Jalan", data_alamat$alamat, ignore.case = TRUE)
data_alamat$alamat <- gsub("jl[]*\\.", "Jalan", data_alamat$alamat, ignore.case = TRUE)
data_alamat$alamat <- gsub("\\bjl\\b", "Jalan", data_alamat$alamat, ignore.case = TRUE)
data_alamat$alamat <- gsub("jalan\\.", "Jalan", data_alamat$alamat, ignore.case = TRUE)
print[data_alamat]

#Menulis data ke file 
write.xlsx(file="staging.alamat.xlsx", x= data_alamat)

#Clear resultest
dbClearResult(rs)

#Menutup koneksi
all_cons <- dbListConnections(MySQL())
for (con in all_cons) dbDisconnect(con)