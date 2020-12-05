library(cowplot)

ggdraw(igstats_plot) +
  draw_image(
    image = "https://academy.dqlab.id/assets/images/logo-dqlab.png",
    x = 0.425,
    y = -0.44,
    scale = 0.1
  )