library(boot) # Ggf. zuvor install.packages("boot")
x <- c(1,2,3)
y <- c(1,2,2)
df <- data.frame(x,y)
glm.fit <- glm(y~x, data = df)
cv.glm(df, glm.fit)$delta[1]
