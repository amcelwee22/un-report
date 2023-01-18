library(tidyverse)
getwd()

gapminder_data <- read_csv("data/gapminder_data.csv")

summarize(gapminder_data, averageLifeExpectancy = mean(lifeExp))

# Working with Messy Data

co2_emmisions_dirty <- read_csv('data/co2-un-data.csv', skip=2,
  col_names = c("region","country","year","series","value","footnotes","source"))

co2_emmisions_dirty %>%
  select(country, year, series, value) %>%
  mutate(series = recode(series, 
            "Emissions (thousand metric tons of carbon dioxide)" = 
              "total_emission", "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions")) %>%
  pivot_wider(names_from = series, values_from = value)


co2_emissions_2005 <- co2_emmisions_dirty %>%
                        filter(year == 2005) %>%
                        select(-year) 

# Bringing in gapminder data

gapminder_pop_data <- read_csv("data/gapminder_data.csv") %>%
  filter(year== 2007) %>%
  select(country, pop, lifeExp, gdpPercap)

# Joining Together Two Dataframes

inner_joined_table <- inner_join(co2_emissions_2005, gapminder_pop_data)

anti_join(co2_emissions_2005, gapminder_pop_data)

full_join_table <- full_join(co2_emissions_2005,gapminder_pop_data) %>%
  view()
