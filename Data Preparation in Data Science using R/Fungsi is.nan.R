#Buat variable contoh.nan 
contoh.nan <- 0/0

#Periksa dengan function is.nan
is.nan(contoh.nan)

#Contoh hasdil bukan NAN
bukan.nan <- 9/3
is.nan(bukan.nan)

bukan.nan2 <- log(3)
is.nan(bukan.nan2)