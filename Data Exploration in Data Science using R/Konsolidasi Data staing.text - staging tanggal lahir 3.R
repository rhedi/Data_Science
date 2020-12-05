library(openxlsx)

#Membaca tiap file staging excel dan menyimpannya dalam variabel bernama awalan staging
staging.text <- read.xlsx("staging.teks.xlsx")
staging.tanggal <- read.xlsx("staging_tanggal_lahir3.xlsx")

#Menggabungkan variabel staging dengan function merge
staging.final <- merge(x=staging.text, y=staging.tanggal, by.x="kode_pelanggan", by.y="kode_pelanggan", all = TRUE)

#Menulis haril file staging.final.xlsx
write.xlsx(staging.final, file = "staging.final.xlsx")