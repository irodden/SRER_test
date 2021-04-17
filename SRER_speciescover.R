# Iris Rodden 
# 04-10-2021
# SRER species total cover per year

# add code to pull data from github online repository
library(httr)

# identify SRER species
library(dplyr)
library(tidyr)

ltcover_2018July10 <- read.csv(file = "https://raw.githubusercontent.com/irodden/SRER_test/master/ltcover_2018July10.csv",
                   na.strings = c("-9999.0","NA"))

# rename PASTTRAN column
colnames(ltcover_2018July10)[1] <- "PASTTRAN"

# sum cover per species for 1957 - 2018 in decadal intervals
ltcover57_18_spp <- ltcover_2018July10 %>%
  group_by(SPECIES) %>%
  summarize(cvr2018 = sum(YR2018, na.rm = TRUE),
            cvr2009 = sum(YR2009, na.rm = TRUE),
            cvr2000 = sum(YR2000, na.rm = TRUE),
            cvr1991 = sum(YR1991, na.rm = TRUE),
            cvr1981 = sum(YR1981, na.rm = TRUE),
            cvr1970 = sum(YR1970, na.rm = TRUE),
            cvr1961 = sum(YR1961, na.rm = TRUE),
            cvr1957 = sum(YR1957, na.rm = TRUE))
write.csv(ltcover57_18_spp,"ltcover57_18_spp.csv")

# sum cover per species for 1957 - 2018 for all years
ltcover57_18_allyr <- ltcover_2018July10 %>%
  group_by(SPECIES) %>%
  summarize(cvr2018 = sum(YR2018, na.rm = TRUE),
            cvr2015 = sum(YR2015, na.rm = TRUE),
            cvr2012 = sum(YR2012, na.rm = TRUE),
            cvr2009 = sum(YR2009, na.rm = TRUE),
            cvr2006 = sum(YR2006, na.rm = TRUE),
            cvr2003 = sum(YR2003, na.rm = TRUE),
            cvr2000 = sum(YR2000, na.rm = TRUE),
            cvr1997 = sum(YR1997, na.rm = TRUE),
            cvr1994 = sum(YR1994, na.rm = TRUE),
            cvr1991 = sum(YR1991, na.rm = TRUE),
            cvr1984 = sum(YR1984, na.rm = TRUE),
            cvr1981 = sum(YR1981, na.rm = TRUE),
            cvr1978 = sum(YR1978, na.rm = TRUE),
            cvr1975 = sum(YR1975, na.rm = TRUE),
            cvr1970 = sum(YR1970, na.rm = TRUE),
            cvr1966 = sum(YR1966, na.rm = TRUE),
            cvr1965 = sum(YR1965, na.rm = TRUE),
            cvr1964 = sum(YR1964, na.rm = TRUE),
            cvr1963 = sum(YR1963, na.rm = TRUE),
            cvr1962 = sum(YR1962, na.rm = TRUE),
            cvr1961 = sum(YR1961, na.rm = TRUE),
            cvr1960 = sum(YR1960, na.rm = TRUE),
            cvr1959 = sum(YR1959, na.rm = TRUE),
            cvr1958 = sum(YR1958, na.rm = TRUE),
            cvr1957 = sum(YR1957, na.rm = TRUE))
write.csv(ltcover57_18_allyr,"ltcover57_18_allyr.csv")



# sum cover per species per pasture for 2018

ltcover2018_year <- ltcover_2018July10 %>%
  group_by(PASTURE,SPECIES) %>%
  summarize(totalyr_cover = sum(YR2018, na.rm = TRUE))
write.csv(ltcover2018_year,"ltcover2018_year.csv")

# sum cover per species for multiple years

ltcover2018_sppYR <- ltcover_2018July10 %>%
  group_by(SPECIES, YR1953, YR1961, YR1970, YR1981, YR1991, YR2000, YR2009, YR2018) %>%
  summarize(totalspp_coverYR = sum(YR1953, YR1961, YR1970, YR1981, YR1991, YR2000, YR2009, YR2018, na.rm = TRUE))
write.csv(ltcover2018_sppYR,"ltcover2018_sppYR.csv")

# split long "SPECIES" column into separate columns by species and change NA to 0. May also use "pivot wider"?
SRER2018_spread <- spread(ltcover2018_year, SPECIES, totalyr_cover, is.na(0))

write.csv(SRER2018_spread,"SRER2018_spread.csv")
