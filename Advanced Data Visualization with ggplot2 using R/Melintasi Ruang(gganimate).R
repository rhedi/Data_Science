library(showtext)
library(gganimate)

igcomments <- read_csv("https://dqlab-dataset.s3-ap-southeast-1.amazonaws.com/igcomments.csv")
glimpse(igcomments)

font_add_google(name = "Roboto Condensed")
showtext.auto()

igcomments_plot <- 
  igcomments %>%
  sample_frac() %>%
  mutate(
    frame = row_number(),
    label = format(date, format = "%e %b %y")
  ) %>%
  ggplot(aes(frame, hour, color = is_video, size = n_comments)) +
  geom_jitter(alpha = 0.8, show.legend = FALSE) + 
  scale_color_manual(values = c("#009AB3", "#B0E601")) +
  scale_size_area(max_size = 12) +
  theme_modern_rc(
    base_family = "Roboto Condensed",
    plot_title_size = 13,
    plot_title_face = "plain",
    subtitle_size = 35,
    subtitle_face = "bold",
    caption_face = "italic"
  ) +
  theme(
    plot.title.position = "plot",
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    plot.caption = element_text(hjust = 0.5),
    axis.text = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank()
  ) +
  coord_polar()

igcomments_anim <- 
  igcomments_plot + 
  labs(
    title = "Constellation of Instagram contentsi",
    substitle = "{current_frame}",
    caption = "More comment make the star bigger\nGreen strats are Vdieo contents"
  ) +
  transition_manual(label, cumulative = TRUE) +
  enter_appear() +
  ease_aes("cubic-in-out")

igcomments_anim