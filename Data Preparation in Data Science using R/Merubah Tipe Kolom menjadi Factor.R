library(openxlsx)
#Membaca dataset dengan read.xlsx dan dimasukkan ke variable penduduk.dki
penduduk.dki.xlsx <- read.xlsx(xlsxFile="https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.xlsx")

penduduk.dki.xlsx$NAMA.PROVINSI <- as.factor(penduduk.dki.xlsx$NAMA.PROVINSI)
str(penduduk.dki.xlsx)