library(openxlsx)

#Membaca file staging.enrichment.mean.xlsx dan menyimpannya dalam variable staging.enrichment.mean
staging.enrichment.mean <- read.xlsx("staging.enrichment.mean.xlsx")

#Membaca file staging.enrichment.kode_pos.xlsx dan menyimpannya dalam variable staging.enrichment.kode_pos
staging.enrichment.kode_pos <- read.xlsx("staging.enrichment.kode_pos.xlsx")

#Membaca file staging.final.xlsx dan menyimpannya dalam variable staging.final 
staging.final <- read.xlsx("staging.final.xlsx")
staging.enrichment.mean

#Membaca file staging.enrichment.kode_pos.xlsx dan menyimpannya dalam variable staging.enrichment.kode_pos
staging.enrichment.kode_pos <- read.xlsx("staging.enrichment.kode_pos.xlsx")

#Ambil field kode_pelanggan, dan kode_pos_enrich saja
staging.enrichment.kode_pos <- staging.enrichment.kode_pos[,c("kode_pelanggan", "kode_pos_enrich", "grouping")]
staging.enrichment.kode_pos

#Membaca file staging.final.xlsx dan menyimpannya dalam variable staging.final
staging.final <- read.xlsx("staging.final.xlsx")

#Menggabungkan variable staging.enrichment.mean dengan staging.enrichment.kode_pos melalui kolom kode_pelanggan
hasil.final <- merge(x=staging.enrichment.mean, y=staging.enrichment.kode_pos, by.x = "kode_pelanggan", 
                     by.y = "kode_pelanggan", all = TRUE)

#Menggabungkan variable staging.final dengan hasil.final melalui kolom kode_pelanggan
hasil.final <- merge(x=staging.final, y=hasil.final, by.x = "kode_pelanggan", by.y = "kode_pelanggan", all = TRUE)
hasil.final

#Menulis hasil ke file staging.final.xlsx
write.xlsx(hasil.final, file = "hasil.final.xlsx")