library(bpa)
library(openxlsx)

data_bpm <- read.xlsx("List_BPM.xlsx", sheet = "NonJabodetabek")

# Melakukan Profiling terhadap seluruh kolom data_bpm
pola.data_bpm_surabaya <- basic_pattern_analysis(data_bpm)

# Merubah Nama Kolom
names(pola.data_bpm_surabaya) <- paste("Pola", names(pola.data_bpm_surabaya), sep = ".")

# Menggabungkan dua data.frame
data_bpm <- cbind(data_bpm, pola.data_bpm_surabaya)

# Menapilkan Struktur
str(data_bpm)

# Menulis File Excel
write.xlsx(data_bpm, file = "data_bpm_nonjabodetabek.xlsx")