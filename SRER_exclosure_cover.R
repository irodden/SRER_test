# Iris Rodden 
# 04-10-2021
# SRER exclosure species total cover per year

# identify SRER species
library(httr)
library(dplyr)
library(tidyr)

exclosure_cover_20201130 <- read.csv(text=GET("https://raw.githubusercontent.com/irodden/SRER_test/master/exclosure_cover_20201130.csv"),
                               na.strings = c("-9999.0","NA"))


# sum cover per species for 2011 - 2020 for all years
excl_Cover11_20_allyr <- exclosure_cover_20201130 %>%
  group_by(Species) %>%
  summarize(cvr2020 = sum(YR2020, na.rm = TRUE),
            cvr2017 = sum(YR2017, na.rm = TRUE),
            cvr2014 = sum(YR2014, na.rm = TRUE),
            cvr2011 = sum(YR2011, na.rm = TRUE))

write.csv(excl_Cover11_20_allyr,"excl_Cover11_20_allyr.csv")

