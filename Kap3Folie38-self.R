library(ISLR2)

# 1: Mit Datensatz vertraut machen
head(Carseats)
summary(Carseats)
str(Carseats)

# 2: Multiple Regressionsfunktion berechnen
# Urban und US sind qualitative Variablen mit Y/N
lmCarseats <- lm(Sales ~ Price + Urban + US, data = Carseats)

# Übersicht über das Modell geben
summary(lmCarseats)

# 5: Nur relevantes Modell, da p-Wert bei Urban 0.936
lmCarseatsSmall <- lm(Sales ~ Price + US, data = Carseats)

# Übersicht über das Modell geben
summary(lmCarseatsSmall)