# Logistische Regression

## Prognosen für den Aktienmarkt

### Kennenlernen des Datensatzes Smarket
library(ISLR2)
attach(Smarket)
??Smarket
names(Smarket)
dim(Smarket)
summary(Smarket)
pairs(Smarket)
### Erster Eindruck: Welche Variablen korrelieren mit `Today`?
cor(Smarket) > 0.1
cor(Smarket[, -9])
### Logistische Regression: glm mit Argument "family = binomial"
### Die Koffizienten werden mittels Maximum-Likelihood-Methode berechnet
glm.fits <- glm ( Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
    data = Smarket, family = binomial )
summary(glm.fits)
### Vorhersage von Wahrscheinlichkeiten mittels predict()
### Falls keine Daten übergeben werden, werden die Daten vom Fitting benutzt
glm.probs <- predict(glm.fits, type = "response")
### Konvertiere Wahrscheinlichkeiten in Klassen (Up / Down)
n <- nrow(Smarket)
glm.pred <- rep("Down", n)
glm.pred[glm.probs > 0.5] = "Up"
### Wahrheitsmatrix (Konfusionsmatrix) erstellen
x <- table(glm.pred, Direction)
### Trainingsfehler
(457 + 141) / n
### Der Trainingsfehler basiert auf einem Modell, bei welchem
### der gesamte Datensatz zum Trainieren benutzt wurde. Dies birgt die Gefahr
### den Testfehler massiv zu unterschätzen.
### Idee: Verwende getrennte Trainings- und Testdaten!
test <- (Year == 2005)
train <- (Year != 2005)
Smarket.2005 <- Smarket[test, ]
dim(Smarket.2005)
Direction.2005 <- Direction[test]
### Benutze für die logistische Regression nur Subset Train
glm.fits <- glm(
    Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
    data = Smarket, family = binomial, subset = train
    )
### Validiere Modell mit Testdaten
glm.probs <- predict(glm.fits, Smarket.2005, type = "response")

glm.pred <- rep("Down", nrow(Smarket.2005))
glm.pred[glm.probs > 0.5] <- "Up"
table(glm.pred, Direction.2005)
mean(glm.pred != Direction.2005)
### Schätzungen von neuen Daten
predict(glm.fits, newdata =
      data.frame(Lag1 = 1.2, Lag2 = -0.8, Lag3 = 0.3, Lag4 = 1.1, Lag5 = 0.9, Volume = 1.2),
    type = "response"
  )
