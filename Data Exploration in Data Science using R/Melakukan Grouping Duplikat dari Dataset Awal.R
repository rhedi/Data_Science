library(RMySQL)
library(stringdist)
library(openxlsx)

#Membuka Koneksi
con <- dbConnect(MySQL(), user="root", host="127.0.0.1", dbname="pelanggan")

#Mengambil Kolom kode_pelanggan, nama dan alamat dari data_pelanggan
s <- "SELECT kode_pelanggan, nama_lengkap, alamat FROM data_pelanggan"

#Mengirim Query 
send <- tryCatch(dbSendQuery(con, s), finally = print("Query Ok MEn"))

#Mengambil data 
data.pelanggan <- fetch(send, n=-1)

#Clear Result 
dbClearResult(send)

#Inisialisasi variable untuk hasil.akhir 
hasil.akhir <- NULL

#Insialisasi variable grouping_no dengan nilai 1
grouping_no <- 1

while(length(data.pelanggan$nama_lengkap)>0)
{
  #Variable referensi nama dan alamat diambil dari item pertama 
  referensi.nama <- data.pelanggan$nama_lengkap[1]
  referensi.alamat <- data.pelanggan$alamat[1]
  
  #MEnghitung jarak antara referensi dengan item-item nama dan alamat 
  #gunakan method "cosine" untuk nama, dan method "lv" untuk alamat 
  jarak.teks.nama <- stringdist(referensi.nama, data.pelanggan$nama, method="cosine")
  jarak.teks.alamat <- stringdist(referensi.alamat, data.pelanggan$alamat, method="lv")
  
  #Hasil filter jarak dengan threshold
  # - lebih kecil sama dengan angka 0.15 untuk nama 
  # - lebih kecil dari angka 15 untuk alamat
  #Disimpan ke variable filter.jarak
  filter.jarak <- (jarak.teks.nama <= 0.15 & jarak.teks.alamat < 15)
  
  #Melakukan filtering pada variable data.pelanggan, dan mengambil tiga kolom 
  #untuk di simpan ke tiga variable 
  kode_pelanggan.temp <- data.pelanggan[filter.jarak,]$kode_pelanggan
  nama.temp <- data.pelanggan[filter.jarak,]$nama
  alamat.temp <- data.pelanggan[filter.jarak,]$alamat
  
  #Konstuksi temporary variable 
  var.temp <- data.frame(grouping=grouping_no, kode_pelanggan=kode_pelanggan.temp, nama=nama.temp, alamat=alamat.temp, jumlah_record=length(kode_pelanggan.temp))
  
  #Menggabungkan temporary variable dengan hasil sebelumnya
  hasil.akhir <- rbind(hasil.akhir, var.temp)
  
  #MEnggabungkan hasil sebelumnya 
  data.pelanggan <- data.pelanggan[!filter.jarak,]
  
  #Menambahkan nilai grouping untuk diambil pada iterasi selanjutnya 
  grouping_no <- grouping_no + 1
}

#Menulis hasi ke file staging.duplikat.awal.xlsx
write.xlsx(hasil.akhir, file = "staging.duplikat.awal3.xlsx")

#Menutup Koneksi Mysql 
ttp <- dbListConnections(MySQL())
for(con in ttp) dbDisconnect(con)