# Bias-Variance Trade-Off bei Validierungsverfahren

# 1. Generiere 100 Zufallsstichproben
# 2. Alle Verfahren durchführen und jeweils MSE_train in Vektoren der Länge 100 Speichern
# 3. Standardabweichungen ermitteln: LOOCV > k-fache KV > Einfache Val.?

# Modell:
# Y = 2*x1 - 0.5*x1^2 + x2 + x2^2 + eps

library(boot)
cv.error=rep(0,10)
for (i in 1:10){
  glm.fit=glm(mpg~poly(horsepower ,i),data=Auto)
  cv.error[i]=cv.glm(Auto,glm.fit)$delta[1]
}






N = 50
MSE1 = rep(0,N)
MSE2 = rep(0,N)
MSE3 = rep(0,N)

n = 100
min = -1
max = 1
for (i in 1:N) {
  x1 = runif(n, min, max)
  x2 = runif(n, min, max)
  eps = rnorm(n, 0, 2)
  y = 2*x1 - x1^2 + x2 + x2^2 + eps
  df = data.frame(x1, x2, y)

  # Einfache Validierung
  train = sample(n,n/2)
  lm1 = lm(y ~ x1 + x2, data = df, subset = train)
  MSE1[i] = mean((df$y - predict(lm1, df))[-train]^2)

  
  
  }
sd(MSE1)


# k-fache Kreuzvalidierung

# LOOCV
