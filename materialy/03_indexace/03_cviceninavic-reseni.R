#1
starwars$name[
  !is.na(starwars$name) &
    starwars$homeworld == "Tatooine" &
    starwars$species != "Droid"]
#nebo
as.vector(
  na.omit(starwars$name[
    starwars$homeworld == "Tatooine" &
      starwars$species != "Droid"
  ])
)
#nebo
swJmena <- na.omit(starwars)
swJmena$name[swJmena$homeworld == "Tatooine" &
               swJmena$species != "Droid"]

#nebo
starwars %>% na.omit() %>%
  filter(homeworld == "Tatooine", species != "Droid") %>%
  select(name)

#...a mnoho dalších iterací

#2
vektor <- c(12, 8, 15, 20, 1, 17)

vektor[2]
vektor[length(vektor)]
vektor[vektor > 10]

#3
#a
census[census$jmeno == "Petr", "vek"]
filter(census, jmeno == "Petr") %>% select(vek)
#b
census[census$mesto %in% c("Brno", "Ostrava"), "jmeno"]
filter(census, mesto %in% c("Brno", "Ostrava")) %>% select(jmeno)
#c
mean(census$vek)

#4
listOsob$osoba2$prijmeni

#5
film$rok
film[["obsazeni"]]
film["oceneni"]

#6
names(teploty) <- c("pondeli", "utery", "streda")
row.names(pocasi)[2] <- "tebou určené jméno"

#7
select(iris, starts_with("p"))

#8
x[3]

#9
iris %>%
  filter(Petal.Length > 4) %>%
  select(Sepal.Length) %>%
  unlist() %>%
  mean() %>%
  round(digits = 3)

#10
iris %>%
  filter(Species == "virginica") %>%
  select(Species, Petal.Length) %>%
  arrange(desc(Petal.Length))