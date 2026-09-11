## extension of hierarchical model - varying slopes
## model equation:
## height = beta_0 + level_int +
## fertility * (beta_1 + level_slp) + eps
### simulate data

n <- 250
n_level <- 15
level_int <- rnorm(n_level, 0, 1.5)
level_slp <- rnorm(n_level, 0, 0.5)
level_id <- sample(1:n_level, n, replace = TRUE)
beta_0 <- 20
beta_1 <- 2
eps <- rnorm(n, 0, 0.5)
fertility <- runif(n, -2, 2)

height <- beta_0 + level_int[level_id] + (beta_1 + level_slp[level_id]) * fertility + eps
dat <- data.frame(height, fertility, level_id = as.factor(level_id))

## fit the model
library(lme4)
m <- lmer(height ~ fertility + (1 + fertility || level_id), dat)
summary(m)

ranef(m)

## plot regression lines
library(ggeffects)
pp <- predict_response(m, terms = c("fertility", "level_id[1, 5, 10, 50]"), type = "random")
plot(pp)

