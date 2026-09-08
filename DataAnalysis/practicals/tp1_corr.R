## read-in the data
setwd("~/LIF/Enseignement/DAST/DataAnalysis/")

library(here)
here::here("")

dat <- read.csv("data/dat_tp1.csv")

## fit a model
dat_nona <- na.omit(dat)
m <- lm(biomass ~ troph_r, data = dat_nona)

library(DHARMa)
ss <- simulateResiduals(m)
plot(ss)
testUniformity(ss)

## interprete model
summary(m)
library(ggeffects)
pp <- predict_response(m, terms = "troph_r")
plot(pp, show_data = TRUE)

plot(biomass ~ troph_r, dat_nona)
abline(m, col = "red")

newdat <- data.frame()
pred <- predict()
plot()