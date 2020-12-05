library(openxlsx)

data_bpm <- read.xlsx("data_bpm_nonjabodetabek.xlsx")

data_bpm$Last_Approver

data_bpm$Last_Approver <- gsub("[^A-Za-z .,]", " ", data_bpm$Last_Approver)
data_bpm$Last_Approver <- gsub("\\b(Agus Suyanto)\\b", "Agus Suyanto", data_bpm$Last_Approver, ignore.case = TRUE)
data_bpm$Last_Approver <- gsub("\\b(Michael Kenry)\\b", "Michael Kenry", data_bpm$Last_Approver, ignore.case = TRUE)
data_bpm$Last_Approver <- gsub("\\bSLAMET SURYANTO\\b", "Slamet Suryanto", data_bpm$Last_Approver, ignore.case = TRUE)
data_bpm$Last_Approver <- gsub("\\bAGUS SUYANTO\\b", "Agus Suyanto", data_bpm$Last_Approver, ignore.case = TRUE)
data_bpm$Last_Approver <- gsub("\\bHADI RAHARDJO\\b", "Hadi Rahardjo", data_bpm$Last_Approver, ignore.case = TRUE)
data_bpm$Last_Approver <- gsub("\\bYOGI AGUNG SUKMANA\\b", "Yogi Agung Sukmana", data_bpm$Last_Approver, ignore.case = TRUE)
data_bpm$Last_Approver <- gsub("\\bJOYCE KRISTOMULJONO\\b", "Joyce Kristomuljono", data_bpm$Last_Approver, ignore.case = TRUE)
#data_bpm$Last_Approver <- gsub("\\botto w.\\b", "otto w", data_bpm$Last_Approver, ignore.case = TRUE)
data_bpm$Last_Approver <- trimws(data_bpm$Last_Approver, which = "both")
write.xlsx(data_bpm, file = "staging.bpm.nonjabodeetabek.xlsx")

data_bpm$Last_Approver