### live coding, model and variable selection

## AIC model selection 
library(MASS)

## simulate some data, 10 covariables, 5 with effects, 5 no effects
n <- 100
X <- matrix(rnorm(n * 11), ncol = 11)
X[,1] <- 1
y <- X %*% c(1, 0.5, 0.2, -0.5, 0.3, -0.2, 0, 0, 0, 0, 0) + rnorm(n, 0, 0.1)
dat <- as.data.frame(cbind(X[,-1], y))
colnames(dat) <- c(paste0("x", 1:10), "y")
# make a model
fullModel <- lm(y ~ ., data = dat)
summary(fullModel)

MASS::stepAIC(fullModel, direction = "both")

## lasso model selection
library(glmnet)
lassoModel <- glmnet(as.matrix(dat[,1:10]), dat$y, alpha = 1)

plot(lassoModel, xvar = "lambda", label = TRUE)

## cross-validate lambda
cvglmnetModel <- cv.glmnet(as.matrix(dat[,1:10]), dat$y, alpha = 1)
plot(cvglmnetModel)
## take optimal lambda
lambdaOpt <- cvglmnetModel$lambda.1se
lambdaOpt
## refit model with optimal lambda
lassoModelOpt <- glmnet(as.matrix(dat[,1:10]), dat$y, alpha = 1, lambda = lambdaOpt)
summary(lassoModelOpt)
## get selected variables
selVars <- rownames(coef(lassoModelOpt))[which(coef(lassoModelOpt) != 0)]
print(selVars)



## 1. confounder effects
## model is height = 20 + 1 * ph_std + 0.5 * nitrogen_std + res
## with correlation between ph and nitrogen
n <- 100
ph <- runif(n, -2, 2)
nitrogen <- 0.5 * ph + rnorm(n, 0, 1)
res <- rnorm(n, 0, 0.1)
height <- 20 + 1 * ph - 2 * nitrogen + res
dat <- data.frame(height, ph, nitrogen)

# fit a model without nitrogen
model_ph <- lm(height ~ ph, data = dat)
summary(model_ph)

# check model assumptions
library(DHARMa)
plot(simulateResiduals(model_ph))

# fit a model with nitrogen
model_ph_nitrogen <- lm(height ~ ph + nitrogen, data = dat)
summary(model_ph_nitrogen)

### 2. p-values do not mean presence of an effect
## simulate pure noise data
x <- runif(100)
y <- 0.25 * x + rnorm(100, sd = 0.3)
xNoise <- matrix(runif(8000), ncol = 80)
dat <- data.frame(y = y, x = x, xNoise)
fullModel <- lm(y ~ ., data = dat)

summary(fullModel)

redModel <- MASS::stepAIC(fullModel, direction = "both", trace = FALSE)
