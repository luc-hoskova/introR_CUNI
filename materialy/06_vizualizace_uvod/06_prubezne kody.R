#PROCVICENI BASE R
#1
plot(
  women$height ~ women$weight,
  type = "p",
  pch = 14,
  col = "purple")

#2
plot(
  mtcars$wt,
  mtcars$mpg,
  type = "p",
  pch = 17,
  col = "darkred",
  main = "Fuel Economy vs Car Weight",
  xlab = "Weight (1000 lbs)",
  ylab = "Miles per gallon")

text(
  mtcars$wt,
  mtcars$mpg,
  labels = rownames(mtcars),
  pos = 1,
  cex = 0.7)

#SAMOSTATNE CVICENI PLOT
plot(
  trees$Girth ~ trees$Height,
  type = "p",
  pch = 19,
  col = "forestgreen")

#PROCVICENI BARPLOT
barplot(table(dataNewborns$sex.C),
        xlab = "Vzdělání matky",
        ylab = "Počet",
        col = rainbow(2)) #prvni dve barvy z palety rainbow

#PROCVICENI LINECHART
head(UKgas)

plot(
  UKgas,
  main = "Čtvrtletní spotřeba plynu ve Velké Británii (1960–1986)",
  xlab = "Rok",
  ylab = "Spotřeba plynu",
  col = "blue",
  lwd = 2)

#SAMOSTATNE CVICENI BASE R
head(chickwts)
str(chickwts)

barplot(table(chickwts$feed),
        xlab = "druh krmiva",
        ylab = "počet krmených kuřat",
        main = "Zastoupení krmiv v datasetu",
        col = rainbow(length(table(chickwts$feed))))

#SAMOSTATNE CVICENI GGPLOT
str(dataNewborns)
dataNewborns$prch.N <- as.factor(dataNewborns$prch.N)

ggplot(dataNewborns, aes(x = prch.N, fill = sex.C)) +
  geom_bar(
    position = "dodge",
    color = "white") +
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    position = position_dodge(width = 1),
    vjust = -0.3,
    colour = "white", #barva textu
    size = 3) + #velikost textu
  labs(
    title = "Počet dětí podle počtu starších sourozenců",
    x = "Počet starších sourozenců",
    y = "Počet dětí",
    fill = "Pohlaví") +
  theme_dark()