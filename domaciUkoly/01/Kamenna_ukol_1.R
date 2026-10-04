#domaci ukol lekce 1

# uploading the file 
load("sources/promenne.RData")

# kolik mesicu ("pocetMesicu") uzivi "rozpocet" "plat" kolika (x) zamestnancu?
x <- rozpocet / (pocetMesicu * plat)

# pro print s proměnnou musím přidat "paste"
print(paste("Rozpocet vyjde pro", x, "zamestnancu"))

# písmenko za % upravuje formát čísla, z desetinného mi celé neudělá a musím zaokrouhlit zvlášť 
print(sprintf("Rozpocet vyjde pro %d zamestnance", round(x)))
