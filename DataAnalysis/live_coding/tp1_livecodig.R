
### live coding extension to linear models


## 1. multiple covariables

# the model height = 20 + 1 * ph + 0.1 * nitrogen + res
# simulate
n <- 100
ph <- runif(100, 0, 12)
nitrogen <- runif(100, 0, 100)
res <- rnorm(100, sd = 0.5)
height <- 20 + 1 * ph + 0.1 * nitrogen + res
# put in one data frame
dat <- data.frame(
    ph = ph,
    nitrogen = nitrogen,
    height = height
)

# fit a model
m <- lm(height ~ ph + nitrogen, data = dat)
summary(m)

# check model assumtions
library(DHARMa)
ss <- simulateResiduals(m)
plot(ss)

# plot predicted responses
library(ggeffects)
plot(predict_response(m, terms = "ph"))
plot(predict_response(m, terms = "nitrogen"))

### 2. categorical covariable
# the model is height = (treatment = control) * 20 +  (treatment = t1) * 30 +  (treatment = t2) * 10
dat <- data.frame(treatment = sample(c("control", "T1", "T2"),
    100,
    replace = TRUE
))
modmat <- model.matrix(~treatment, dat)
betas <- c(20, 10, -10)
dat$linpred <- modmat %*% betas
dat$height <- dat$linpred + rnorm(100, sd = 10)

# the model
m <- lm(height ~ treatment, data = dat)
summary(m)

# plot predicted response
plot(predict_response(m))

### 3. interaction
# the model is height = ph + nitrogen + ph:nitrogen
n <- 100
ph <- runif(n, 4, 8)
nitrogen <- runif(n, 0, 100)
res <- rnorm(n, 0, 1)
height <- 20 + 1 * ph + 0.1 * nitrogen + 0.5 * ph * nitrogen + res

dat <- data.frame(height, ph, nitrogen)

# fit the model
model <- lm(height ~ ph * nitrogen, data = dat)
summary(model)

# stdandardize the variables
dat$ph_std <- scale(dat$ph)[,1]
dat$nitrogen_std <- scale(dat$nitrogen)[,1]
dat$height <- with(dat, 30 + 1*ph_std + 1*nitrogen_std + 0.5*ph_std*nitrogen_std + res)
# re-fit the model with standardized variables
model_std <- lm(height ~ ph_std * nitrogen_std, data = dat)
summary(model_std)

# plot the response
library(ggeffects)

plot(predict_response(model_std, terms = c("ph_std", "nitrogen_std")),show_data = TRUE)


