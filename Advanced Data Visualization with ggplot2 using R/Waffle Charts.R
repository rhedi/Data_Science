library(waffle)
library(ggplot2)
library(dplyr)

faskes_kalimantan_plot <-
  faskes_kalimantan %>%
  ggplot(aes(fill = faskes, values = jumlah)) +
  facet_wrap(~provinsi) + 
  geom_waffle(color = "white")
faskes_kalimantan_plot