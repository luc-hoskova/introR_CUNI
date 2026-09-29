#domaci ukol lekce 1

# uploading the file 
load("promenne.RData")
#procpak tu mam sources? Co to ma provadet? Takto si to sama nenactu :(

# kolik mesicu ("pocetMesicu") uzivi "rozpocet" "plat" kolika (x) zamestnancu?
x <- rozpocet / (pocetMesicu * plat)
#opravdu budu platit 0.05 lidi? ;)

# pro print s proměnnou musím přidat "paste"
print(paste("Rozpocet vyjde pro", x, "zamestnancu"))

# písmenko za % upravuje formát čísla, z desetinného mi celé neudělá a musím zaokrouhlit zvlášť 
print(sprintf("Rozpocet vyjde pro %d zamestnance", round(x)))

#hezka prace, ale pracuj prosim prevazne s funkcemi, ktere jsme se uz naucili 

