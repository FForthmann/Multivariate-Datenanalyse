library(ISLR2)

# 1: Numerische Zusammenfassung der wöchentlichen Daten
head(Weekly)
summary(Weekly)

# 1: Grafische Zusammenfassung der wöchentlichen Daten
pairs(Weekly)

# 2: Logistischs Regressionsmodell für Direction und Lag-Variablen sowie Volume
weeklyGlm <- glm(Weekly$Direction ~ Weekly$Lag1+Weekly$Lag2+Weekly$Lag3+Weekly$Lag4+Weekly$Lag5+Weekly$Volume,
                 data=Weekly,
                 family=binomial)
# Laut summary ist lediglich Lag2 relevent, weil dort der p-wert < 0,5
summary(weeklyGlm)

# 3: Konfusionsmatrix und Trainingsfehler berechnen -> für Lag2, weil er statistisch relevanz erscheint
# Es werden die Schwellwerte nach "Down" und "Up" umgeformt - Matrix
probabilitiesGlm = predict(weeklyGlm, type="response")
matrixGlm = rep("Down", length(probabilitiesGlm))
matrixGlm[probabilitiesGlm>0.5] = "Up"
table(matrixGlm, Weekly$Direction)
# Trainingsfehler
mean(matrixGlm != Weekly$Direction)

# 4: Logistisches Regressionsmodell von 1990 bis 2008 - muss noch korrigiert werden
train = (Year < 2009)
Weekly.0910 = Weekly[!train,]
glm.fit = glm(Direction~Lag2,
              data=Weekly,
              family=binomial,
              subset=train)
glm.probs = predict(glm.fit, Weekly.0910,type="response")
glm.pred = rep("Down", length(glm.probs))
glm.pred[glm.probs>0.5] = "Up"
Direction.0910 = Direction[!train]
table(glm.pred, Direction.0910)
mean(glm.pred != Direction.0910)