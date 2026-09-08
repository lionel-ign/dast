## load data
dat <- read.csv("~/LIF/Enseignement/DAST/DataAnalysis/data/dat_tp2.csv")

dat$mqd_std <- (dat$mqd - mean(dat$mqd)) / sd(dat$mqd)
dat$zp_std <- scale(dat$zp)[,1]
dat$reserutile_std <- scale(dat$reserutile)[,1]
dat$troph_std <- scale(dat$troph_r)[,1]
dat$ownership <- factor(dat$ownership)

m <- lm(biomass ~ zp_std + reserutile_std + troph_std, data = dat)
summary(m)

pp <- predict_response(m, terms = c("troph_std","zp_std[2, -2]", "reserutile_std[-2, 2]"))
plot(pp)

m <- lm(biomass ~ troph_std + ownership, data = dat)
anova(m)
summary(m)

pp <- predict_response(m, terms = c("ownership", "troph_std[-2, 0, 2]"))
plot(pp) 

m <- lm(biomass ~ troph_std + ownership + troph_std:ownership, data = dat)
m <- lm(biomass ~ troph_std*ownership, data = dat)
summary(m)

pp <- predict_response(m, terms = c("troph_std", "ownership"))
plot(pp) 

pp <- predict_response(m, terms = c("ownership", "troph_std"))
plot(pp) 


m <- lm(biomass ~ zp * troph_r, dat)
summary(m)
m <- lm(biomass ~ zp_std * troph_std, dat)
summary(m)

ggplot(dat, aes(x=zp, y=biomass)) +
  stat_smooth() +
  labs(x = "Elevation (m)",
       y = "Biomass (t/ha)")

library(ggplot2)
ggplot(dat, aes(x=zp, y=biomass)) +
  stat_smooth() +
  labs(x = "Elevation (m)",
       y = "Biomass (t/ha)")
m <- lm(biomass ~ log(zp), dat)
pp <- predict_response(m, terms = c("zp"))
plot(pp) 

