library(openxlsx)

data.pelanggan <- read.xlsx("staging_tanggal_lahir2.xlsx")

#Membaca data tanggal_lahir sebagai tipe data Date
data.pelanggan$tanggal_lahir <- as.Date(data.pelanggan$tanggal_lahir, "%d-%m-%Y")

#Set tanggal referensi ke 27 April 2018
tanggal_referensi <- as.Date("27-04-2018", "%d-%m-%Y")

#Menghitung perbedaan tanggal dalam tahun
data.pelanggan$umur <- as.numeric(difftime(tanggal_referensi, data.pelanggan$tanggal_lahir, units = "days"))/365

#Menghitung umur maksimal 80 tahun
data.pelanggan$umur_valid <- data.pelanggan$umur <= 80

#Format ulang tanggal lahir 
data.pelanggan$tanggal_lahir< format(data.pelanggan$tanggal_lahir, "%d-%m-%Y")

#Menampilkan data.pelanggan
data.pelanggan

#Menulis hasil ke file staging_tanggal_lahir3.xlsx
write.xlsx(data.pelanggan, file = "staging_tanggal_lahir3.xlsx")