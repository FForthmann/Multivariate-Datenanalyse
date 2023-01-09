## Code-Beispiel Kapitel 3, Folie 27
## Illustration der Notwendigkeit des F-Tests

p <- 100 # Anzahl Prädiktoren
n <- 1000 # Anzahl Beobachtungen
set.seed(1) # Initialisierung Zufallsgenerator
v <- runif(n*(p+1),-1,1) # Erzeuge gleichverteilte Zufallszahlen
df <- data.frame(matrix(data = v, nrow = n, ncol = p+1)) # data.frame
colnames(df)[101] <- "Y" # Umbenennung der letzten Variablen
summary(lm(Y~.,data = df)) # Lineare Regression
