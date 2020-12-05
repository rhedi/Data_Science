library(RMySQL)
library(openxlsx)

#Membaca file staging.final.xlsx
data.pelanggan <- read.xlsx("staging.final.xlsx")

str(data.pelanggan)

#--------------------------1. PERSIAPAN:MENEMUKAN DUPLIKASI ALAMAT ----------------------

#Konversi Factor
data.pelanggan$kode_pos <- as.factor(data.pelanggan$kode_pos)

#inisialiasi variable grouping_no dengan nilai 1
grouping_no <- 1

#inisialisasi hasil.akhir
hasil.akhir <- NULL

while(length(data.pelanggan$kode_pos)>0)
{
  #Variable referensi alamat diambil dari item pertama
  referensi.alamat <- data.pelanggan$alamat[1]
  
  #Menghitung jarak anatara refernsi dengan item alamat dengan method "lv"
  jarak.teks.alamat <- stringdist(referensi.alamat, data.pelanggan$alamat, method = "lv")
  
  #Hasil filter jarak dengan threshold
  # - lebih kecil dari angka 10 untuk alamat
  # disimpan ke variable filter.jarak 
  filter.jarak <- (jarak.teks.alamat < 10)
  
  #Melakukan filtering pada variable data.pelanggan, dan mengambil dua kolom untuk disimpan ke dua variable 
  kode_pelanggan.temp <- data.pelanggan[filter.jarak,]$kode_pelanggan
  alamat.temp <- data.pelanggan[filter.jarak,]$alamat
  kode_pos_temp <- data.pelanggan[filter.jarak,]$kode_pos
  
  #konstruksi temporary variable 
  var.temp <- data.frame(grouping=grouping_no, kode_pelanggan=kode_pelanggan.temp, 
                         kode_pos=kode_pos_temp, alamat=alamat.temp, jumlah_record=length(kode_pelanggan.temp))
  
  #Menggabungkan temporary variable dengan hasil sebelumnya 
  hasil.akhir <- rbind(hasil.akhir, var.temp)
  
  #Membuang porsi yang sudah ditemukan 
  data.pelanggan <- data.pelanggan[!filter.jarak,]
  
  #Menambahkan nilai grouping untuk di ambil pada iterasi selanjutnya
  grouping_no <- grouping_no + 1
}
hasil.akhir
summary(hasil.akhir$kode_pos)

#------------------------------------ 2. MENGISI KODE POS YANG KOSONG ---------------------------------
#Inisialisasi kolom baru kode pos 
hasil.akhir$kode_pos_enrich <- hasil.akhir$kode_pos

#Mengambil nomor grouping kode pos yang kosong 
kode_pos_kosong <- hasil.akhir[hasil.akhir$kode_pos == "-",]

while(length(kode_pos_kosong$kode_pos)>0)
{
  grouping_no <- kode_pos_kosong$grouping[1]
  
  #Membuat variable filter 
  filter.data <- hasil.akhir$grouping == grouping_no & hasil.akhir$kode_pos != "-"
  
  #Mengambil data pertama dari hasil filter dengan function head 
  temp.data <- head(hasil.akhir[filter.data,], 1)
  
  #Mengisi kolom kode_pos_enrich dengan kolom kode_pos yang ditemukan 
  hasil.akhir[hasil.akhir$grouping == grouping_no,]$kode_pos_enrich <- temp.data$kode_pos
  
  #Menghapus row pertama dari variable kode_pos_kosong
  kode_pos_kosong <- kode_pos_kosong[-1,]
}

hasil.akhir
summary(hasil.akhir$kode_pos_enrich)

#Menulis hasil ke file staging.enrichment.kode_pos.xlsx
write.xlsx(hasil.akhir, file = "staging.enrichment.kode_pos.xlsx")