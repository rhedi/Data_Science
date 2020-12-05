library(arules)

transaksi <- read.transactions("data_transaksi.txt", sep = "\t", format = "single", cols = c(1,2), skip = 1)

data_item <- itemFrequency(transaksi, type = "absolute")

# Kalau dijalankan masih menghasilkan 
# Gula  Pet Food     Sirup Teh Celup 
# 4         5         6         8 

#Melakukan sorting pada data_item

data_item <- sort(data_item, decreasing = TRUE)

# Hasilnya menghasilkan 
# Teh Celup     Sirup  Pet Food      Gula 
# 8         6         5         4 

# Mengambil 3 Item pertama 

data_item <- data_item[1:3]

# Menghasilkan 
# Teh Celup     Sirup  Pet Food 
# 8         6         5 

# Konversi data_item menjadi data frame dengan kolom Nama_produk dan Jumlah 

data_item <- data.frame("Nama Produk" = names(data_item), "Jumlah" = data_item, row.names = NULL)

print(data_item)