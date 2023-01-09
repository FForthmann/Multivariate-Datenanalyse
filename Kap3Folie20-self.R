library(ISLR2)

# 2: Mit Merkmalen des Datensatzes vertraut machen
head(Auto)
str(Auto)
summary(Auto)

# 3: Lineare Regression berechnen lassen
lmAuto <- lm(mpg ~ horsepower)
summary(lmAuto) # Interbretationen siehe Christiansens Dokumente

# 4: Streudiagramm malen
plot(horsepower, mpg)
abline(lmAuto, col = "orange")

# 5: Vorhersage bei 98 PS
a <- lmAuto$coefficients[1]
b <- lmAuto$coefficients[2]
# Quick and dirty: a + b * 98
predict(lmAuto, data.frame(horsepower=98))
