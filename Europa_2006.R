# Before run script libraries are needed like sp and rgdal
# to install type in Console below:


# install.packages("sp")
# install.packages("rgdal")

# "sp"  and" "rgdal" <- it's a name of package

library("sp")
library("rgdal")
# Europa 2006 -  kiedy Adam Sulich rządził takimi danymi w swoejej Tabeli Z1
print ("Wyniki procedury Hellwiga - koloryzowane")

europe.map <- readOGR(dsn=".\\Pliki_shapefile", "test_final_no1")
print ("dane poprawnie wpisane do klasy europe.map")
class(europe.map)

print (unique(europe.map$NAME))
print (unique(europe.map$CC))

plot(europe.map)

print ("grupa 1")
#  if you want to change color of group change string here in kolor1 variable
kolor1 = "springgreen3"
# each line declares a country
# col declares color
plot(europe.map[europe.map$CC == "LU", ], col = kolor1, add = TRUE) # Luxemburg
plot(europe.map[europe.map$CC == "HU", ], col = kolor1, add = TRUE) # Hungary
plot(europe.map[europe.map$CC == "EZ", ], col = kolor1, add = TRUE) # Czech
plot(europe.map[europe.map$CC == "PL", ], col = kolor1, add = TRUE) # Cebulacy
plot(europe.map[europe.map$CC == "GM", ], col = kolor1, add = TRUE) # Germany
plot(europe.map[europe.map$CC == "PO", ], col = kolor1, add = TRUE) # Portugal
plot(europe.map[europe.map$CC == "DA", ], col = kolor1, add = TRUE) # Denmark


print ("grupa 2")
kolor2 = "dodgerblue2"

plot(europe.map[europe.map$CC == "CY", ], col = kolor2, add = TRUE) # Cyper
plot(europe.map[europe.map$CC == "FR", ], col = kolor2, add = TRUE) # France
plot(europe.map[europe.map$CC == "UK", ], col = kolor2, add = TRUE) # United Kingdom
plot(europe.map[europe.map$CC == "HR", ], col = kolor2, add = TRUE) # Croatia
plot(europe.map[europe.map$CC == "AU", ], col = kolor2, add = TRUE) # Austria
plot(europe.map[europe.map$CC == "IT", ], col = kolor2, add = TRUE) # Italy
plot(europe.map[europe.map$CC == "SP", ], col = kolor2, add = TRUE) # Spain

print ("grupa 3")
kolor3 = "darkorange2"

plot(europe.map[europe.map$CC == "SW", ], col = kolor3, add = TRUE) # slweden
plot(europe.map[europe.map$CC == "SI", ], col = kolor3, add = TRUE) # slovenia
plot(europe.map[europe.map$CC == "BU", ], col = kolor3, add = TRUE) # Bulgary
plot(europe.map[europe.map$CC == "FI", ], col = kolor3, add = TRUE) # Finland
plot(europe.map[europe.map$CC == "EN", ], col = kolor3, add = TRUE) # estonia 
plot(europe.map[europe.map$CC == "LH", ], col = kolor3, add = TRUE) # Lithuania
plot(europe.map[europe.map$CC == "RO", ], col = kolor3, add = TRUE) # Romania

print ("grupa 4")
kolor4 = "purple"

plot(europe.map[europe.map$CC == "LG", ], col = kolor4, add = TRUE) # lativia
plot(europe.map[europe.map$CC == "LO", ], col = kolor4, add = TRUE) # slovakia
plot(europe.map[europe.map$CC == "MT", ], col = kolor4, add = TRUE) # Malta
plot(europe.map[europe.map$CC == "BE", ], col = kolor4, add = TRUE) # Belgium
plot(europe.map[europe.map$CC == "NL", ], col = kolor4, add = TRUE) # Netherland
plot(europe.map[europe.map$CC == "EI", ], col = kolor4, add = TRUE) # Irleand
plot(europe.map[europe.map$CC == "GR", ], col = kolor4, add = TRUE) # Grece

print("Famous watercolorist is still painting, please wait...")
