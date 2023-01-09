### Übung Logsistische Regression, Datensatz Weekly
library(ISLR2)
summary(Weekly)
pairs(Weekly)
cor(Weekly[,-9])
# Auch hier: Lediglich Korrelation zwischen Year und Volume erkennbar.
attach(Weekly)
glm.fit = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
              data=Weekly,
              family=binomial)
summary(glm.fit)
### Lag2 scheint statistisch signifikant zu sein.
glm.probs = predict(glm.fit, type="response")
glm.pred = rep("Down", length(glm.probs))
glm.pred[glm.probs>0.5] = "Up"
table(glm.pred, Direction)
#          Direction
# glm.pred Down  Up
# Down       54  48
# Up        430 557
mean(glm.pred != Direction)
### Trainingsfehler: 0.44
train = (Year < 2009)
Weekly.0910 = Weekly[!train,]
glm.fit = glm(Direction~Lag2,
              data=Weekly,
              family=binomial,
              subset=train)
glm.probs = predict(glm.fit, Weekly.0910,type="response")
glm.pred = rep("Down", length(glm.probs))
glm.pred[glm.probs>.5] = "Up"
Direction.0910 = Direction[!train]
table(glm.pred, Direction.0910)
mean(glm.pred != Direction.0910)
