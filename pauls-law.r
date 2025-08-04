#! /usr/bin/env Rscript

df <- read.csv("pairs.csv")
df$gender <- as.factor(df$gender)
df$logd <-  log(df$dist2/df$dist1,2)
df$time1 <- as.double(df$time1)
df$time2 <- as.double(df$time2)
df$split1 <- df$time1/df$dist1*500
df$split2 <- df$time2/df$dist2*500
df$delta <- df$split2 - df$split1
df$paul <- df$delta/df$logd
df$alpha <- log(df$time2/df$time1)/log(df$dist2/df$dist1)
 
png(filename = "paul.png", width = 800, height = 600, res = 100)
hist(df$paul,
     main = "Paul's Constant",
     xlab = "Change over 500m (Seconds)",
     ylab = "Frequency",
     col = "skyblue",
     border = "black",
     breaks = 100,
     freq = TRUE
     )
dev.off()
png(filename = "power.png", width = 800, height = 600, res = 100)
hist(df$alpha,
     main = "Power Law",
     xlab = "Constant Alpha",
     ylab = "Frequency",
     col = "skyblue",
     border = "black",
     breaks = 100,
     freq = TRUE
     )
dev.off()

summary(df$paul)
summary(df$alpha)

