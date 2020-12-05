library(readr)


indodapoer <- read_tsv("https://dqlab-dataset.s3-ap-southeast-1.amazonaws.com/indodapoer.tsv.gz")
#indodapoer <- read.csv("INDODAPOERData.csv", sep = ",")

nrow(indodapoer)
ncol(indodapoer)