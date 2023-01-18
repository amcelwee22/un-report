library(tidyverse)

# 1997 Data

ggplot(data= gapminder_1997) + 
  aes(x = gdpPercap, y = lifeExp, size = pop/1000000, color = continent, shape = continent) +
  geom_point() +
  labs(x ="GPD Per Capita", y = "Life Expectancy (years)", size = "Population (in millions)") +
  scale_color_brewer(palette = "Set1")

# All gapminder Data

gapminder_data <- read_csv("C:/Users/Rosenoko/Desktop/un-report/un-report/gapminder_data.csv")

ggplot(data = gapminder_data) +
  aes(x=year, y=lifeExp, color=continent, group = country) +
  geom_line()

str(gapminder_data)

ggplot(data = gapminder_data) +
  aes(x=continent, y=lifeExp) +
  geom_boxplot()

ggplot(data = gapminder_data) +
  aes(x=continent, y=lifeExp) +
  geom_jitter(aes(size = pop)) +
  geom_violin() 
  
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins=20) +
  theme_dark()

ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_grid(rows = vars(continent))

ggsave("awesome_plot.jpg", width=6, height=4)
