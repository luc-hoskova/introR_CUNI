getwd() #defakto zde neni treba pro vypocet -
  #pokud to nekomu poslu jako projekt tak tam je
  #jiz working directory nastaveny automaticky
  #a neni treba ho kontrolovat

load("promenne.RData")

rozpocet / (plat * pocetMesicu)
  #teoreticky spravne, ale - opravdu by se platilo
  #za 0.05 uvazku ;) ?

#MOZNE RESENI
rozpocet %/% (plat * pocetMesicu) #3
  #kolik CELYCH osob by se nam podarilo zaplatit?