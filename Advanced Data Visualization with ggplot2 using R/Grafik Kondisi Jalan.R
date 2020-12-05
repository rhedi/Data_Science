library(ggplot2)
library(ggridge)
library(dplyr)

jalan_kabkota_plot <- 
  jalan_kabkota %>% 
  ggplot(aes(panjang_jalan, kondisi)) +
  facet_wrap(~status) +
  geom_density_ridges_gradient(
    aes(fill = after_stat(x)),
    show.legend = FALSE
  )
jalan_kabkota_plot