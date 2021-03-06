fish_data <- read.csv("data/Gaeta_etal_CLC_data_1.csv")
library(tidyverse)
View(fish_data_cat)

## creates new table categorizing fish by size 
fish_data_cat <-  fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small")) %>% 
  filter(scalelength > 1)


## histogram of length vs scalelength vs lakeid (colored)
ggplot(data = fish_data_cat, mapping = aes(length, scalelength, color = lakeid)) +
  geom_point()


## histogram of scalelength by size
ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram()

scale_hist_by_length <- ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram()

ggsave("figures/scale_hist_by_length.jpeg")


## Plot histogram of scale length by fish categorical size
length_fish_size_histogram <- ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram(bins = 80)

ggsave("figures/length_fish_size_histogram.jpeg")





