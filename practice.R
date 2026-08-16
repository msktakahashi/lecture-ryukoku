
# 初回のみ必要
# install.packages("SnowData")

library(SnowData)
library(ggplot2)
library(dplyr)

rm(list = ls())

data(cholera_cases)
data(pump_locations)
data(streets)

streets <- streets |>
  mutate(
    across(
      c(
        start_coord_east,
        start_coord_north,
        end_coord_east,
        end_coord_north
      ),
      ~ as.numeric(as.character(.x))
    )
  )

head(cholera_cases)

ggplot(cholera_cases,
       aes(x = Easting, y = Northing)) +
  geom_point(aes(size = Count), alpha = 0.6) +
  coord_fixed() +
  theme_minimal()

ggplot(streets) +
  geom_segment(
    aes(
      x = start_coord_east,
      y = start_coord_north,
      xend = end_coord_east,
      yend = end_coord_north
    ),
    linewidth = 0.3
  ) +
  coord_fixed()

ggplot() +
  geom_segment(
    data = streets,
    aes(
      x = start_coord_east,
      y = start_coord_north,
      xend = end_coord_east,
      yend = end_coord_north
    ),
    linewidth = 0.3
  ) +
  geom_point(
    data = cholera_cases,
    aes(x = Easting, y = Northing, size = Count),
    alpha = 0.6
  ) +
  geom_point(
    data = pump_locations,
    aes(x = Easting, y = Northing),
    shape = 17,
    size = 3
  ) +
  geom_text(
    data = pump_locations,
    aes(x = Easting, y = Northing, label = id),
    nudge_y = 15,
    size = 3
  ) +
  coord_fixed() +
  theme_void()
