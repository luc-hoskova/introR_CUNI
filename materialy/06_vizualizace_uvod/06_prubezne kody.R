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

