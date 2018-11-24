library("sp")
library("rgdal")
# Europa 2011 -  kiedy Adam Sulich rządził takimi danymi w swoejej Tabeli Z1
print ("Wyniki procedury Hellwiga - koloryzowane")

europe.map <- readOGR(dsn=".\\Pliki_shapefile", "test_final_no1")
print ("dane poprawnie wpisane do klasy europe.map")
class(europe.map)

print (unique(europe.map$NAME))
print (unique(europe.map$CC))

plot(europe.map)

print ("grupa 1")
kolor1 = "springgreen3"

plot(europe.map[europe.map$CC == "BE", ], col = kolor1, add = TRUE) # Belgium
plot(europe.map[europe.map$CC == "RO", ], col = kolor1, add = TRUE) # Romania
plot(europe.map[europe.map$CC == "LG", ], col = kolor1, add = TRUE) # Lativia
plot(europe.map[europe.map$CC == "PL", ], col = kolor1, add = TRUE) # Cebularki
plot(europe.map[europe.map$CC == "EZ", ], col = kolor1, add = TRUE) # CZechy
plot(europe.map[europe.map$CC == "LO", ], col = kolor1, add = TRUE) # slovakia
plot(europe.map[europe.map$CC == "UK", ], col = kolor1, add = TRUE) # Earl grey



print ("grupa 2")
kolor2 = "dodgerblue2"

plot(europe.map[europe.map$CC == "SI", ], col = kolor2, add = TRUE) # slovenia
plot(europe.map[europe.map$CC == "EN", ], col = kolor2, add = TRUE) # estonia 
plot(europe.map[europe.map$CC == "FI", ], col = kolor2, add = TRUE) # Finland
plot(europe.map[europe.map$CC == "LH", ], col = kolor2, add = TRUE) # Lithuania
plot(europe.map[europe.map$CC == "BU", ], col = kolor2, add = TRUE) # Bulgary
plot(europe.map[europe.map$CC == "SW", ], col = kolor2, add = TRUE) # slweden
plot(europe.map[europe.map$CC == "SP", ], col = kolor2, add = TRUE) # Spain


print ("grupa 3")
kolor3 = "darkorange2"

plot(europe.map[europe.map$CC == "PO", ], col = kolor3, add = TRUE) # Portugal
plot(europe.map[europe.map$CC == "IT", ], col = kolor3, add = TRUE) # Italy
plot(europe.map[europe.map$CC == "NL", ], col = kolor3, add = TRUE) # NetherLands
plot(europe.map[europe.map$CC == "GR", ], col = kolor3, add = TRUE) # Greece
plot(europe.map[europe.map$CC == "MT", ], col = kolor3, add = TRUE) # malta
plot(europe.map[europe.map$CC == "EI", ], col = kolor3, add = TRUE) # Irleand
plot(europe.map[europe.map$CC == "LU", ], col = kolor3, add = TRUE) # Luxemburg

print ("grupa 4")
kolor4 = "purple"

plot(europe.map[europe.map$CC == "AU", ], col = kolor4, add = TRUE) # Austria
plot(europe.map[europe.map$CC == "CY", ], col = kolor4, add = TRUE) # Cyper
plot(europe.map[europe.map$CC == "HR", ], col = kolor4, add = TRUE) # Croatia
plot(europe.map[europe.map$CC == "DA", ], col = kolor4, add = TRUE) # Denmark
plot(europe.map[europe.map$CC == "HU", ], col = kolor4, add = TRUE) # Hungary
plot(europe.map[europe.map$CC == "GM", ], col = kolor4, add = TRUE) # Germany
plot(europe.map[europe.map$CC == "FR", ], col = kolor4, add = TRUE) # Fracusę

print("Famous watercolorist is still painting, please wait...")








