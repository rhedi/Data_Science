library(openxlsx)

#Membaca file staging Excel hasil standarisasi tanggal lahir
data.pelanggan <- read.xlsx("staging_tanggal_lahir1.xlsx")

#Menggunakan as.Date untuk melakukan konversi kolo, tangga_lahir dan menyimpan kembali ke kolom tersebut
data.pelanggan$Tanggal_Lahir <- format(as.Date(data.pelanggan$Tanggal_Lahir, "%d-%m-%Y"), "%d-%m-%Y")
data.pelanggan

#Menulis hasil ke file staging_tanggal_lahir2.xlsx
write.xlsx(data.pelanggan, file = "staging_tanggal_lahir2.xlsx")