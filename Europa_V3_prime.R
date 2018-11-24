library("sp")
library("rgdal")
# Europa 2006 -  kiedy Adam Sulich rządził takimi danymi w swoejej Tabeli Z1
print ("Wyniki procedury Hellwiga - koloryzowane")

europe.map <- readOGR(dsn="C:\\Users\\zemat\\Documents\\Rrr", "test_final_no1")
print ("dane poprawnie wpisane do klasy europe.map")
class(europe.map)

print (unique(europe.map$NAME))
print (unique(europe.map$CC))

plot(europe.map)

print ("grupa 1")
kolor1 = "springgreen3"
plot(europe.map[europe.map$CC == "LU", ], col = kolor1, add = TRUE)
plot(europe.map[europe.map$CC == "HU", ], col = kolor1, add = TRUE)
plot(europe.map[europe.map$CC == "EZ", ], col = kolor1, add = TRUE) # CZechy
plot(europe.map[europe.map$CC == "PL", ], col = kolor1, add = TRUE)
plot(europe.map[europe.map$CC == "GM", ], col = kolor1, add = TRUE)
plot(europe.map[europe.map$CC == "PO", ], col = kolor1, add = TRUE)
plot(europe.map[europe.map$CC == "DA", ], col = kolor1, add = TRUE) # Denmark


print ("grupa 2")
kolor2 = "dodgerblue2"
plot(europe.map[europe.map$CC == "CY", ], col = kolor2, add = TRUE) # Cyper
plot(europe.map[europe.map$CC == "FR", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$CC == "UK", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$CC == "HR", ], col = kolor2, add = TRUE) # Croatia
plot(europe.map[europe.map$CC == "AU", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$CC == "IT", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$CC == "SP", ], col = kolor2, add = TRUE) # Spain

print ("grupa 3")
kolor3 = "darkorange2"

plot(europe.map[europe.map$CC == "SW", ], col = kolor3, add = TRUE) # slweden
plot(europe.map[europe.map$CC == "SI", ], col = kolor3, add = TRUE) # slovenia
plot(europe.map[europe.map$CC == "BU", ], col = kolor3, add = TRUE)
plot(europe.map[europe.map$CC == "FI", ], col = kolor3, add = TRUE)
plot(europe.map[europe.map$CC == "EN", ], col = kolor3, add = TRUE) # estonia 
plot(europe.map[europe.map$CC == "LH", ], col = kolor3, add = TRUE) # Lithuania
plot(europe.map[europe.map$CC == "RO", ], col = kolor3, add = TRUE)
print ("grupa 4")
kolor4 = "purple"

plot(europe.map[europe.map$CC == "LG", ], col = kolor4, add = TRUE) # lativia
plot(europe.map[europe.map$CC == "LO", ], col = kolor4, add = TRUE) # slovakia
plot(europe.map[europe.map$CC == "MT", ], col = kolor4, add = TRUE) # malta
plot(europe.map[europe.map$CC == "BE", ], col = kolor4, add = TRUE)
plot(europe.map[europe.map$CC == "NL", ], col = kolor4, add = TRUE)
plot(europe.map[europe.map$CC == "EI", ], col = kolor4, add = TRUE) # irlandia
plot(europe.map[europe.map$CC == "GR", ], col = kolor4, add = TRUE)

