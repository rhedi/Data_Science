library(openxlsx)

#Mempersiapkan Data
dataCreditRating <- read.xlsx(xlsxFile = "https://academy.dqlab.id/dataset/credit_scoring_dqlab.xlsx")
str(dataCreditRating)

#Melakukan konversi kolom risk_rating menjadi factor
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating)

#Melihat struktur setelah konversi
str(dataCreditRating)