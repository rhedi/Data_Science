library(openxlsx)

data_bpm <- read.xlsx("List_BPM.xlsx" sheet = "NonJabodetabek")

data_bpm$No_Memo

data_bpm$No_Memo <- gsub("\\bmemorate\\b", "memo rate", data_bpm$No_Memo, ignore.case = TRUE)
data_bpm$No_Memo <- gsub("\\bMEMO RATE\\b", "memo rate", data_bpm$No_Memo, ignore.case = TRUE)
data_bpm$No_Memo <- gsub(" - ", "-", data_bpm$No_Memo, ignore.case = TRUE)
data_bpm$No_Memo <- gsub("2020 ", "2020", data_bpm$No_Memo, ignore.case = TRUE)
data_bpm$No_Memo <- gsub(" No.", "", data_bpm$No_Memo, ignore.case = TRUE)
data_bpm$No_Memo <- gsub("- ", "-", data_bpm$No_Memo, ignore.case = TRUE)
#data_bpm$No_Memo <- trimws(data_bpm$No_Memo, which = "both")
write.xlsx(data_bpm, file = "staging.bpm.nonjabodeetabek.xlsx")

data_bpm$No_Memo