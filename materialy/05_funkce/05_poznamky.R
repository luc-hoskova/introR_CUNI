#05. poznamky
#############
# PROCVICENI
#############
# IF ... ELSE
#1
vek <- 44
souhlas <- FALSE

if (vek >= 15) {"Ano: splnilo věkovou hranici"} else
  if (souhlas == TRUE) {"Ano: splnilo podmínku o souhlasu rodičů"} else {"Ne: nesplnilo žádnou z podmínek vstupu"}

#2
fVek <- 53
seniori <- 65
studenti <- 26

if (fVek >= seniori) {"Franta má nárok na zlevněné jízdné pro seniory."} else
  if (fVek <= studenti) {"Franta má nárok na zlevněné jízdné pro studenty."} else {paste("Franta nemá nárok na zlevněné jízdné. Je mu totiž", fVek, "")}

#IFELSE
#1
iris %>%
  mutate(
    Sepal.Length = ifelse(
      Sepal.Length > 5,
      Sepal.Length + 10,
      Sepal.Length - 10))

#2
iris %>%
  mutate(
    transformace = ifelse(
      Petal.Length > median(Petal.Length),
      sqrt(Petal.Length),
      NA))

#CASE_WHEN
#1

str(iris)
sum(is.na(iris))

irisOprava <- iris %>%
  mutate(Species = case_when(
    Species == "setosa" ~ "blackhead iris",
    Species == "versicolor" ~ "harlequin blueflag",
    Species == "virginica" ~ "virginia blueflag")
  ) %>%
  mutate(Species = as.factor(Species))

str(irisOprava)

#2
lide %>%
  mutate(
    status = case_when(
      pohlavi == "Z" & vek > 60 ~ "seniorka",
      pohlavi == "M" & vek > 60 ~ "senior",
      .default = "ostatní"))

# FOR CYKLUS
#1
látka <- 100
hmotnost <- NULL

for (i in 1:10) {
  látka <- látka * 0.9
  hmotnost[i] <- látka}

hmotnost[10]

#2
obyvatele <- 500

for (rok in 1:5) {
  obyvatele <- obyvatele * 2
  print(obyvatele)}

# APPLY
#1
# prumer stanice
apply(teploty, 1, mean)
# max stanice
apply(teploty, 1, max)
# prumer dny
apply(teploty, 2, mean)

#2
kultury <- list(
  kultura_A = c(100, 120, 140, 160),
  kultura_B = c(200, 250, 300),
  kultura_C = c(50, 60, 70, 80, 90))

sapply(kultury, mean)
sapply(kultury, max)

######################################################
# SAMOSTATNE CVICENI
######################################################
# IF ... ELSE
znamka <- 5
pocetBodu <- 17
semestralka <- TRUE

if (znamka < 5 & pocetBodu != 0)
  {paste("Julie má známku", znamka, "a získala", pocetBodu, "bodů, má proto nárok na vyznamenání.")} else
  if (semestralka == TRUE & pocetBodu >= 50)
    {paste("Julie má počet bodů", pocetBodu, "a napsala seminárku, má proto nárok na vyznamenání.")} else
    {"Julie nemá právo na vyznamenání."}

#CAUSE_WHEN
data %>%
  mutate(
    z = case_when(
      x %% 2 == 0 ~ sqrt(x) + y,
      x %% 2 == 1 ~ (x / y)^2,
      .default = NA))

# FOR CYKLUS
#a) varianta
sedmRano <- 10
for (i in 1:5) {
  sedmRano <- sedmRano + 1.5
  print(sedmRano)
}

#b) varianta
sedmRano <- 10
teplota <- NULL
for (i in 1:5) {
  sedmRano <- sedmRano + 1.5
  teplota[i] <- sedmRano}
teplota

# APPLY
#1
#prumerne koncentrace
sapply(vzorky, mean)
#maximalni koncentrace
sapply(vzorky, max)

#2
#pocet mereni
sapply(vzorky, length)