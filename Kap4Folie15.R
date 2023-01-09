## Kapitel 4, Folie 15
# Logistische Regression

# Erzeuge Datensatz (siehe GeoGebra)
x <- c(0.5,0.75,1,1.25,1.5,1,1.5,2,2.5,3)
y <- c(0,0,0,0,0,1,1,1,1,1)
df <- data.frame(x,y)

# Berechnung der log. Regression
glm1 <- glm(data=df, y~x, family = binomial)

# Ergebnis ausgeben
summary(glm1)
