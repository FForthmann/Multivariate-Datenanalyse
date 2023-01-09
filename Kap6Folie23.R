# Erzeugen Sie mittels `rnorm()` einen Prädiktor $X$ der Länge $n = 100$ sowie einen "Rauschvektor" eps der Länge $n = 100$.

set.seed(1)
X = rnorm(100)
eps = rnorm(100)

# Erzeugen Sie einen Vektor $Y$ (Zielgröße) der Länge $n = 100$ gemäß dem Modell
# 
#   Y = \beta_0 + \beta_1 X + \beta_2 X^2 + \beta_3 X^3 + \epsilon.
#   
# $\beta_0, \beta_1, \beta_2$ und $\beta_3$ können Sie beliebig wählen.

beta0 = 2
beta1 = -2
beta2 = 2
beta3 = 1
Y = beta0 + beta1 * X + beta2 * X^2 + beta3 * X^3 + eps

# Wählen Sie mittels `regsubsets()` das beste Modell aus, das die Prädiktoren $X_1 = X, X^2,\dots,X^{10}$ enthält. Welches ist das beste Modell gemäß $C_p$, BIC bzw. adjustiertem $R^2$? Plotten Sie Diagramme, um Ihre Antwort zu belegen, und geben Sie die Koeffizienten des jeweils besten  Modells an. Sie müssen dabei die Vektoren $X$ und $Y$ mittels `data.frame(X = X, Y = Y)` in einen Datenframe verpacken.

library(leaps)
data.full = data.frame(y = Y, x = X)
mod.full = regsubsets(y~poly(x, 10, raw = T), data=data.full, nvmax=10)
mod.summary = summary(mod.full)
mod.summary

which.min(mod.summary$cp)
which.min(mod.summary$bic)
which.max(mod.summary$adjr2)

# Plotten
plot(mod.summary$cp, xlab="Anzahl Prädiktoren", ylab="Cp", pch=20, type="l")
points(4, mod.summary$cp[3], pch=4, col="red", lwd=2)
plot(mod.summary$bic, xlab="Anzahl Prädiktoren", ylab="BIC", pch=20, type="l")
points(3, mod.summary$bic[3], pch=4, col="red", lwd=2)
plot(mod.summary$adjr2, xlab="Anzahl Prädiktoren", ylab="Adj. R2", pch=20, type="l")
points(4, mod.summary$adjr2[3], pch=4, col="red", lwd=2)
