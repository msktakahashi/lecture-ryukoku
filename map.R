
install.packages("HistData")
library(HistData)
library(ggplot2)

ggplot() +
  geom_path(
    data = Snow.streets,
    aes(x = x, y = y, group = street),
    linewidth = 0.3
  ) +
  geom_point(
    data = Snow.deaths,
    aes(x = x, y = y),
    size = 1
  ) +
  geom_point(
    data = Snow.pumps,
    aes(x = x, y = y),
    shape = 17,
    size = 3
  ) +
  coord_fixed() +
  theme_void()
