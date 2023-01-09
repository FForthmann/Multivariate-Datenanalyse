### Kapitel 3. Übung Multiple Regression

# 1.
library(ISLR2)
head(Carseats)
summary(Carseats)

# 2.
lm1 <- lm(Sales ~ Price + Urban + US, data = Carseats)
summary(lm1)
coef(lm1)
# (Intercept)       Price    UrbanYes       USYes 
# 13.04346894 -0.05445885 -0.02191615  1.20057270 
# Interpretation der Koeffizienten:
# beta0 = 13.04: Durchschnittlicher Absatz für ein Geschäft, dass weder
#                in einer Stadt liegt (Urban = No) noch in den USA
#                (US = No) und Price = 0. (Extrapolation)
# beta1 = -0.054: Wenn sich Price um eine Einheit erhöht, verringert 
#                 sich der Absatz durchschnittlich um 0.054 Einheiten
# beta2 = -0.022: Durchschnittlicher Unterschied des Absatzes zwischen
#                 den Geschäften, die nicht in einer Stadt liegen und
#                 denen die in einer Stadt liegen (Urban = No -> Yes)
# beta3 = 1.2: Durchschnittlicher Unterschied des Absatzes zwischen
#              den Geschäften, die nicht in den USA liegen und
#              denen die in den USA liegen (US = No -> Yes)

# 3. Lineare Regressionsgleichung:
# Sales = beta0 + beta1 * Price + beta2 * Urban + beta3 * US
#          = .... (Fallunterscheidung mit 4 Fällen)
# Siehe Foliensatz

# 4.
# H_0: beta_j = 0 kann zurückgewiesen werden für die beiden Prädiktoren Price und US

# 5.
lm2 <- lm(Sales ~ Price + US, data = Carseats)
summary(lm2)