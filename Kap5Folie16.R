library(boot) # Ggf. zuvor install.packages("boot")
cv.error=rep(0,10)
for (i in 1:10){
  glm.fit=glm(mpg~poly(horsepower ,i),data=Auto)
  cv.error[i]=cv.glm(Auto,glm.fit)$delta[1]
}


plot(cv.error)
cv.error