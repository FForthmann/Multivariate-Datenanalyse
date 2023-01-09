library(ISLR2)
set.seed(1)
n <- nrow(Auto)
train <- sample(n, n/2)
lm.fit <- lm(mpg ~ horsepower, data = Auto, subset = train)
mean((Auto$mpg - predict(lm.fit, Auto))[-train]^2)
lm.fit2 <- lm(mpg ~ poly(horsepower,2), data = Auto, subset = train)
mean((Auto$mpg - predict(lm.fit2, Auto))[-train]^2)
lm.fit3 <- lm(mpg ~ poly(horsepower,3), data = Auto, subset = train)
mean((Auto$mpg - predict(lm.fit3, Auto))[-train]^2)

library(ggplot2)
ggplot(Auto, aes(x=horsepower, y=mpg)) + geom_point() + stat_smooth(se=F, method='lm', formula = y ~ x)

ggplot(Auto, aes(x=horsepower, y=mpg)) + geom_point() +
  stat_smooth(se=F, method='lm', formula = y ~ poly(x,2))

ggplot(Auto, aes(x=horsepower, y=mpg)) + geom_point() +
  stat_smooth(se=F, method='lm', formula = y ~ poly(x,3))