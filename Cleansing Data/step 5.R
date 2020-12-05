library(openxlsx)

jabodetabek <- read.xlsx("staging1.list.bpm.xlsx")

surabaya <- read.xlsx("staging.bpm.surabaya.xlsx")

staging.1 <- merge(x=jabodetabek, y=surabaya, all=TRUE)

medan <- read.xlsx("staging.bpm.medan.xlsx")

staging.2 <- merge(x=staging.1, y=medan, all=TRUE)

semarang <- read.xlsx("staging.bpm.semarang.xlsx")

bandung <- read.xlsx("staging.bpm.bandung.xlsx")

staging.3 <- merge(x=semarang, y=bandung, all=TRUE)

staging.4 <- merge(x=staging.2, y=staging.3, all=TRUE)

solo <- read.xlsx("staging.bpm.solo.xlsx")

nonjabodetabek <- read.xlsx("staging.bpm.nonjabodeetabek.xlsx")

staging.5 <- merge(x=solo, y=nonjabodetabek, all=TRUE)

staging.6 <- merge(x=staging.4, y=staging.5, all=TRUE)

write.xlsx(staging.6, file = "staging.final.bpm.xlsx")