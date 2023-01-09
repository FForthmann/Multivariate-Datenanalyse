library(ISLR2)
set.seed(1)
n <- nrow(Default)
train = sample(n, n/2)
glm.fit = glm(default ~ income + balance, data = Default, family = binomial,
              subset = train)
glm.pred = rep("No", n/2)
glm.probs = predict(glm.fit, Default[-train, ], type = "response")
glm.pred[glm.probs > 0.5] = "Yes"
mean(glm.pred != Default[-train, ]$default)
