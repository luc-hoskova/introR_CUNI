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
