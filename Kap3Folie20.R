## Aufgabe: Lineare Einfachregression
## Kapitel 3, Folie 20

# 1.
library(ISLR2) # ggf. vorher installieren mit install.packages("ISLR2")

# 2.
head(Auto) # Ausgabe der ersten Zeilen
summary(Auto) # Zusammenfassung der Variablen
??Auto # R-Studio Hilfe

# 3.
lmAuto <- lm(mpg ~ horsepower, data = Auto) # Lineare Regression berechnen
summary(lmAuto) # Ergebnisse der linearen Regression anzeigen

# 4.
attach(Auto) # Objekt dem Namespace hinzufügen
plot(horsepower, mpg) # Streudiagramm zeichnen
abline(lmAuto, col = "red") # Regressionsgerade hinzufügen

# 5.
beta0 <- lmAuto$coefficients[1] # Achsenabschnitt
beta1 <- lmAuto$coefficients[2] # Steigung
x <- 98 # Gegebener Wert
beta0 + beta1 * x # Prognosewert
# Alternativ mit predict()-Funktion
predict(lmAuto, data.frame(horsepower = 98))
