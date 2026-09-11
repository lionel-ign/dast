## livecoding session GLM

### a poisson glm with a log link function
### the model is log(lambda) = 1 + 0.5 * x, y ~ Poisson(lambda)
# simulate data
n <- 100
x <- runif(n, -2, 2)
lambda <- exp(1 + 0.5 * x)
y <- rpois(n, lambda)

dat <- data.frame(x, y)

plot(x, y)

m <- glm(y ~ x, data = dat, family = poisson(link = "log"))
summary(m)

## check model assumptions
library(DHARMa)
ss <- simulateResiduals(m)
plot(ss)

## interpretation of coefficients
library(ggeffects)
plot(predict_response(m, terms = "x"), show_data = TRUE)

## derive R²    
library(rsq)
rsq(m)
