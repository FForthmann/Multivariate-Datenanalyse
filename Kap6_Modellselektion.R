# Modellselektion

## Subset Selection Methoden

### Best Subset Selection

library(ISLR2)
### Datensatz Hitters
### Ziel: Gehalt von Baseballspielern vorhersagen
?Hitters
# View ist auskommentiert, weil dafür das Package CLI installiert sein muss -> Fehler
#View(Hitters)
# Fehlende Werte
sum(is.na(Hitters$Salary))
Hitters <- na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))
### Paket für benötigte regsubset()-Methode laden
library(leaps) # ggf. vorher install.packages("leaps")
regfit.full <- regsubsets(Salary ~ ., Hitters)
summary(regfit.full)
### Mit nvmax Anzahl Variablen wählbar (Standardwert: 8)
regfit.full <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19)
reg.summary <- summary(regfit.full)
reg.summary
### Ausgabe der R^2-Werte der einzelnen Modelle
names(reg.summary)
reg.summary$rsq
### Graphische Übersicht relevanter Gütemaße
par(mfrow = c(2, 2))
### Plotte RSS
plot(reg.summary$rss, xlab = "Anzahl Variablen",  ylab = "RSS", type = "l")
### Plotte Adjr2
plot(reg.summary$adjr2, xlab = "Anzahl Variablen", ylab = "Adjustiertes R^2", type = "l")
### Markiere maximales adjustiertes R^2
reg.summary$adjr2
which.max(reg.summary$adjr2)
points(11, reg.summary$adjr2[11], col = "red", cex = 2, pch = 20)
### Plotte Cp
plot(reg.summary$cp, xlab = "Anzahl Variablen", ylab = "Cp", type = "l")
### Markiere minimalen Cp
which.min(reg.summary$cp)
points(10, reg.summary$cp[10], col = "red", cex = 2, pch = 20)
### Plotte BIC
plot(reg.summary$bic, xlab = "Anzahl Variablen", ylab = "BIC", type = "l")
### Markiere minimalen BIC
which.min(reg.summary$bic)
points(6, reg.summary$bic[6], col = "red", cex = 2, pch = 20)
### regfit besitzt eine eingebaute plot-Funktionalitaet:
plot(regfit.full, scale = "r2")
plot(regfit.full, scale = "adjr2")
plot(regfit.full, scale = "Cp")
plot(regfit.full, scale = "bic")

########################
### Forward / Backward Stepwise Selection
########################
regfit.fwd <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19, method = "forward")
summary(regfit.fwd)
regfit.bwd <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19, method = "backward")
summary(regfit.bwd)
### Im Vergleich zum Best Subsection Selection Unterschied z.B. bei n=7 Prädiktoren
coef(regfit.full, 7)
coef(regfit.fwd, 7)
coef(regfit.bwd, 7)