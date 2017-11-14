Ver <- read.csv("http://www1.appstate.edu/~arnholta/Data/Verizon.csv")
head(Ver)
library(tidyverse)
ggplot(data=Ver, aes(x=Time, fill=Group)) +
  geom_density() +
  facet_grid(.~Group) +
  scale_fill_manual(values= c("Royal Blue", "Purple")) +
  theme_bw() +
  guides(fill= FALSE) +
  geom_vline(aes(xinterupt=Q3) data=Vera)
Vera <- Ver %>%
  group_by(Group) %>%
  summarize(Q3=quantile(Time, prob=0.75))

