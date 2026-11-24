koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")

koncentrace_num <- as.numeric(gsub(" mg/l", "", koncentrace))
#a nemame nejakou funkci ktera by toto udelala snadneji? ;]

vysledek <- ifelse(koncentrace_num > 100, "Vysoká koncentrace",
                   ifelse(koncentrace_num >= 50 & koncentrace_num <= 100,
                          "Normální koncentrace",
                          "Nízká koncentrace"))

tabulka <- data.frame(
  koncentrace = koncentrace,
  popis = vysledek,
  row.names = names(koncentrace)
)
#opravdu musime vytvaret celou tabulku?
#sice hezke, ale trochu nad ramec
  #pripadne by stacila funkce names
print(tabulka)
#hm, proc tady pouzivas print?
#nestacilo by nasledujici:
tabulka
