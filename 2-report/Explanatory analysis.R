#===============================================================================
#EXPLANATORY ANALYSIS
#===============================================================================

library(tidyverse)
library(knitr)

df2 <- read_csv("C:/Users/Mantas/Downloads/train_data.csv")

dim(df2)

summary(df2[1:6])


summary(df2[7:13]) %>%
  kable()

df2$loan_purpose <- as.factor(df2$loan_purpose)
df2$y <- as.factor(df2$y)

summary(df2$loan_purpose) %>%
  kable()

df2 %>%
  group_by(loan_purpose) %>%
  summarise(n = n()) %>%
  ggplot(aes(fill=y, y=n, x=loan_purpose)) + 
  geom_bar(position="dodge", stat="identity") + 
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  theme_dark()

df2 %>%
  group_by(loand_purpose) %>%
  summarise(n = n()) %>%
  ggplot(aes(fill=y, y=n, x=credit_score)) + 
  geom_bar(position="dodge", stat="identity") + 
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  theme_dark()
