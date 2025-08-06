#! /usr/bin/env Rscript

library(ggplot2)

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

mean_paul <- mean(df$paul)
mean_alpha <- mean(df$alpha)

summary(df$paul)
summary(df$alpha)

p1 <-
  ggplot(data=df, aes(x = paul)) +
  geom_histogram(bins=60, fill="skyblue") +
  geom_vline(aes(xintercept = mean_paul)) +
  labs(title = "Distribution of Paul's Constant",
       subtitle = paste("Mean =", round(mean_paul, 2)),
       x = "Constant",
       y = "Frequency")
ggsave("paul.png", p1)

p2 <-
  ggplot(data=df, aes(x = alpha)) +
  geom_histogram(bins=60, fill="skyblue") +
  geom_vline(aes(xintercept = mean_alpha)) +
  labs(title = "Distribution of Constant Alpha",
       subtitle = paste("Mean =", round(mean_alpha, 3)),
       x = "Constant",
       y = "Frequency")

ggsave("power.png", p2)


