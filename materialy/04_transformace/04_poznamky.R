#04. lekce
#DOMACI UKOL

#1)
hodnoty <- seq(15.2, 45.7, 0.56)
hodnoty[seq(0, length(hodnoty), by = 5)]

#2)
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

