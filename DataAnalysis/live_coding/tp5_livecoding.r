## hierarchical models

### simulate some data
### model is 
### height = beta_0 + plot_effect + eps
n <- 250
n_plot <- 15
plot_effect <- rnorm(n_plot, 0, 1.5)
plot_id <- sample(1:n_plot, n, replace = TRUE)
beta_0 <- 20
eps <- rnorm(n, 0, 0.5)

height <- beta_0 + plot_effect[plot_id] + eps
dat <- data.frame(height, plot_id = as.factor(plot_id))

## simple lm
m <- lm(height ~ plot_id, dat)
m <- lm(height ~ -1 + plot_id, dat)
summary(m)

## varying intercepts model
library(lme4)
m <- lmer(height ~ 1 + (1 | plot_id), dat)
summary(m)

## grab estimated variance
VarCorr(m)
# first line plot_id is plot variation
# second line is residual variation

## check assumption
library(DHARMa)
ss <- simulateResiduals(m)
plot(ss)

## plot variation between plots
rr <- ranef(m)
plot(rr$plot_id[,1])

library(ggeffects)
plot(predict_response(m, terms = "plot_id", type = "random"))
