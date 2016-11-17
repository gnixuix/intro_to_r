library(ggplot2)
library(data.table)
library(dplyr)

load("suicides.rdata")
all_suicides <- copy(suicides)
suicides <- suicides %>% 
  group_by(year,state,means) %>% 
  mutate(death = sum(deaths))

## the basics
bare <- ggplot(suicides)

## adding plot aesthetics
aesthetic <- ggplot(suicides, aes(x=year, y=deaths))

## adding points
scatter <- ggplot(suicides, aes(x=year, y=deaths)) + 
  geom_point()

# split "means" by color 
color_by_means <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_point()

# facet by state
state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_bar(aes(fill=means), stat="identity") +
  facet_wrap(~state, scales="free")