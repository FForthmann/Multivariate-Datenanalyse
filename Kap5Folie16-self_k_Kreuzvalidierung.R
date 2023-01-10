library(boot) # Ggf. zuvor install.packages("boot")
set.seed(17)
cv.error=rep(0,10)
for (i in 1:10){
  glm.fit=glm(mpg~poly(horsepower ,i),data=Auto)
  # K-fache Validierung, also 10-fache Kreuzvalierung durch anpassung von K
  cv.error[i]=cv.glm(Auto,glm.fit, K=10)$delta[1]
}

# Wenn nicht die Anzahl von Klassen durch Parameter k festgelegt wird, werden 392 Modelle trainiert (pro Row eins)
nrow(Auto)
cv.error
# Grafik: Ab Wert 2 passiert wenig, deshalb 2 nehmen als Polynom
plot(cv.error)