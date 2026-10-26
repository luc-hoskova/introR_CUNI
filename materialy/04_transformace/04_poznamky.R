#04. lekce
#DOMACI UKOL
#1)
hodnoty <- seq(15.2, 45.7, 0.56)
hodnoty[seq(0, length(hodnoty), by = 5)]

#2)
filter(airquality, Month == 5, Day %in% 1:7) %>% select(Temp) %>% unlist()

#3
airquality$Weather[airquality$Temp > 70] <- "hot"
airquality$Weather[airquality$Temp <= 70] <- "cold"

#############################
#PROCVICOVANI
#############################
#PROCVICOVANI PIPES
#1
str(chickwts)
levels(chickwts$feed)
filter(feed == "soybean") %>%
  select(weight) %>%
  min()

#2
str(quakes)
quakes %>%
  filter(mag > median(mag)) %>%
  filter(depth == max(depth)) %>%
  select(depth)

############################
#SAMOSTATNE CVICENI
############################
#NAHRAVANI DAT
data <- read.delim("samostatneCviceniData.txt",
                   dec = ",",
                   stringsAsFactors = TRUE)
str(data)
mean(data$vyska)

#CHYBEJICI HODNOTY
df[df == "N/A" | df == ""] <- NA

#TRANSFORMACE DAT
#1. VERZE
census <- read.csv("census.csv")
str(census)

census <- census %>%
  rename(
    vira = vira_txt,
    pohlavi = pohlavi_txt,
    vek = vek_txt,
    oblast = uzemi_txt)

census <- census %>%
  mutate(vek = readr::parse_number(vek))

census <- census %>%
  filter(
    vira %in% c("Jedi", "Sith") | startsWith(vira, "pasta"),
    pohlavi == "žena",
    vek %in% 0:18 | vek >= 65,
    oblast == "Česká republika")

census <- census %>%
  select(hodnota, pohlavi, vek, vira)

census <- census %>%
  arrange(desc(vek))

jedi <- census %>% filter(vira == "Jedi",
                          hodnota > 0)
max(jedi$vek)

levels(as.factor(census$vira))

jedi <- census %>% filter(vira == "Jedi",
                          hodnota > 0)
sith <- census %>% filter(vira == "Sith",
                          hodnota > 0)
pasta <- census %>% filter(vira == "pastafariánství",
                           hodnota > 0)

mean(jedi$vek)
mean(sith$vek)
mean(pasta$vek)

#2. VERZE
census2 <- read.csv("census.csv")
str(census2)

census2 <- census2 %>%
  rename(
    vira = vira_txt,
    pohlavi = pohlavi_txt,
    vek = vek_txt,
    oblast = uzemi_txt) %>%
  mutate(vek = readr::parse_number(vek)) %>%
  filter(
    vira %in% c("Jedi", "Sith") | startsWith(vira, "pasta"),
    pohlavi == "žena",
    vek %in% 0:18 | vek >= 65,
    oblast == "Česká republika",
    hodnota > 0) %>%
  select(hodnota, pohlavi, vek, vira) %>%
  arrange(desc(vek))

census2 %>% group_by(vira) %>%
  summarize(nejstarsiVerici = max(vek), prumernyVek = mean(vek))