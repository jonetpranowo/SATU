#Read data
dat <- read.csv("ArrestMini.csv")
names(dat)

#Create new variables: "DATE" and "TIME" from variables "ARRESTTIME"
library(tidyr)
library(dplyr)
dat1 <- dat %>% 
  separate(ARRESTTIME, c('DATE', 'TIME'), sep = 'T')

#Aggregate by case
Arrest_Daily <- dat1 %>%
  mutate(Date = as.Date(DATE, "%m/%d/%Y")) %>%
  group_by(DATE) %>%
  summarize(CASES = n(), NUM_COUNCIL = n_distinct(COUNCIL_DISTRICT)) %>%
  arrange(DATE) 


View(Arrest_Daily)

#Plot Date ~ Numb_Council
RDATE <- as.Date(Arrest_Daily$DATE)
fix(RDATE)
plot(RDATE, Arrest_Daily$NUM_COUNCIL, type="l", col="red", xlab = "TIME", main = "Number of council districts that is affected by cirime", ylab = "Number of Council")

#Selesai

