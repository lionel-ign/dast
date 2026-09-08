## model selection


library(dplyr)
dat <- read.csv("LIF/Enseignement/DAST/DataAnalysis/data/dat_tp3.csv")

dat %>%
  select(-biomass, -idp) %>%
  mutate(across(where(is.numeric), ~ scale(.x)[,1])) %>%
  bind_cols(select(dat, idp, biomass)) -> dat_std

dat_std <- na.omit(dat_std)
m <- lm(biomass ~ ., dat_std)

library(MASS)

m_best <- stepAIC(m)

plot(dat_std$biomass, predict(m_best))
abline(0, 1)

x <- dplyr::select(dat_std, -biomass)

## lasso
library(glmnet)

