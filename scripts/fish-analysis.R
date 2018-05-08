fish_data <- read.csv("data/Gaeta_etal_CLC_data_1.csv")
library(ggplot2)
View(fish_data_cat)

## creates new table categorizing fish by size 
fish_data_cat <-  fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small")) %>% 
  filter(scalelength > 1)


ggplot(data = fish_data_cat, mapping = aes(length, scalelength, color = lakeid)) +
  geom_point()

  