#1
#Z datasetu `dplyr::starwars` vyberte vsechny charaktery:
  #u kterych máme hodnoty ve vsech sloupcich (zadne NA)
  #ktere pochazi z Tatooine
  #nejsou to Droidi

#Napoveda: zkontrolujte si, zda vybrane charaktery opravdu splnuji zadane podminky!
#k vyberu budete muset pouzit funkci, kterou se zbavite `NA`.
#Vyhledejte si na internetu (nikoliv AI) alespon dve funkce, ktere muzete vyuzit k vyyreseni tohoto prikladu.

#2
#Vytvor vektor body s hodnotami 12, 8, 15, 20, 1, 17.
#Vyber druhy prvek, posledni prvek a vsechny hodnoty vetsi než 10.

#3
#Vyber z nasledujiciho data frame tyto informace:
  #a) jaky je vek osoby jmenem Petr
  #b) kdo bydli v Brne a ostrave
  #c) jaky je prumerny vek osob v dataframe

census <- data.frame(
  jmeno = c("Anna", "Petr", "Eva"),
  vek = c(22, 31, 27),
  mesto = c("Praha", "Brno", "Ostrava"))

#4
#Jake je prijmeni jedince v listu osoba2?

listOsob <- list(osoba1 = list(jmeno = "Saša", prijmeni = "Nových"),
                 osoba2 = list(jmeno = "Robin", prijmeni = "Uhlů"))

#5
#Ziskej rok filmu jako hodnotu, obsazeni jako vektor a oceneni jako podlist.
film <- list(
  jmeno = "The Matrix",
  rok = 1999,
  obsazeni = c("Keanu Reeves", "Carrie-Anne Moss"),
  oceneni = c("Academy Awards", "BAFTA Awards", "Grammy Awards", "Hugo Awards"))

#6
#Pojmenuj jednotlive prvky vektoru a prejmenuj POUZE druhy radek data frame.
teploty <- c(18, 21, 19)

pocasi <- data.frame(
  den = c("Po", "Ut", "St"),
  teplota = c(18, 21, 19))

#7
#Vyber z datasetu iris vsechny sloupce, co zacinaji na pismeno "p".

#8
#Nasledujici kod ma vratit treti prvek vektoru. Oprav ho.

x <- c(10, 20, 30, 40, 50)
x(3)

#9
#Kod ma provest nasledujici:
  #vybrat ty radky, kde Petal.Length ke vetsi nez 4
  #vybrat u nich sloupec Sepal.Length a spocitat jeho prumer
#Oprav ho, aby tyto podminky splnoval.
iris %>%
  filter(Petal.Length >= 4) %>%
  select(Sepal.Length) %>%
  median()

#10
#Kod ma provest nasledujici:
  #vybrat pouze druh virginica
  #ponechal sloupce Species a Petal.Length
  #seradil vysledek sestupne podle Petal.Length
#Oprav ho, aby tyto podminky splnoval.

iris %>%
  filter(species == "virginica") %>%
  arrange(Petal.Length)