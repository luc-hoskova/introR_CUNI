plat<-30000; pocetMesicu<-6; rozpocet<-549480
#odkud se nam vzala tato cisla?
#jak vime, ze plat je 3000?
#veskere promenne jiz mame ulozene v souboru promenne.RData
#staci ho nahrat :)

"zamestnanci"<-rozpocet%/%(plat*pocetMesicu)
#procpak zde bylo zvoleno, ze se ma promenna ukladat jako text?
#neukladame si nejakou textovou informaci
#to ze se to ulozilo je defakto jen nahoda
#R jako nazev potrebuje nejake symboly ktere jsou vyjadreny jako text
#takze to v tomto pripade vyjimecne fungovalo
#podivejte se co by se ale stalo kdybych se to pokusila ulozit takto

3<-rozpocet%/%(plat*pocetMesicu)

#chvalim ale usporne a spravne napsany vypocet!