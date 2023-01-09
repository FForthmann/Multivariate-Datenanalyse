predictProbs <- function(model, x){
  logits <- predict(model,x)
  probs <- exp(logits)/(1+exp(logits))
  return(probs)
}

# Test der obigen Funktion
glmDefault <- glm(data = Default, default ~ balance, family = binomial)
predictProbs(glmDefault, data.frame(balance=1000))
