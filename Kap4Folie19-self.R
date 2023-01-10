predictProbs <- function (model, x){
  logits <- predict(model, x)
  probablility <- exp(logits)/(1+exp(logits))
  return(probablility)
}

glmDefault <- glm(data = Default, default ~ balance, family = binomial)
predict(glmDefault, data.frame(balance = 1000))