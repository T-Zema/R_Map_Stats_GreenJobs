library("sp")
library("rgdal")

print ("Transformation in progress")

poland.map <- readOGR(dsn=".\\Pliki_shapefile", "województwa") #argumentami są nazwa folderu oraz nazwa pliku (nie podajemy rozszerzenia)
#poland.map <- readOGR(dsn=path.expand("~/Rrr", "wojewĂłdztwa")
print ("dane poprawnie wpisane do klasy poland.map")

class(poland.map)
ncol(poland.map@data)
poland.map@data <- poland.map@data[ , c(6,16)]
names(poland.map@data) <- c("nazwa", "powierzchnia")
print(head(poland.map@data, n=16))
# Header 1 
plot(poland.map)
print ("grupa 1")
kolor1 = "springgreen3"
plot(poland.map[poland.map$nazwa == "mazowieckie", ], col = kolor1 , add = TRUE)
plot(poland.map[poland.map$nazwa == "œl¹skie", ], col = kolor1 , add = TRUE)
plot(poland.map[poland.map$nazwa  == "dolnoœl¹skie", ], col = kolor1 , add = TRUE)

print ("grupa 2")
kolor2 = "dodgerblue2"
plot(poland.map[poland.map$nazwa == "ma³opolskie", ], col = kolor2, add = TRUE)
plot(poland.map[poland.map$nazwa == "opolskie", ], col = kolor2, add = TRUE)
plot(poland.map[poland.map$nazwa  == "³ódzkie", ], col = kolor2, add = TRUE)
plot(poland.map[poland.map$nazwa  == "wielkopolskie", ], col = kolor2, add = TRUE)

print ("grupa 3")
kolor3 = "darkorange2"
plot(poland.map[poland.map$nazwa == "kujawsko-pomorskie", ], col = kolor3, add = TRUE)
plot(poland.map[poland.map$nazwa == "œwiêtokrzyskie", ], col = kolor3, add = TRUE)
plot(poland.map[poland.map$nazwa  == "lubuskie", ], col = kolor3, add = TRUE)

print ("grupa 4")
kolor4 = "purple"
plot(poland.map[poland.map$nazwa == "warmiñsko-mazurskie", ], col = kolor4, add = TRUE)
plot(poland.map[poland.map$nazwa == "zachodniopomorskie", ], col = kolor4, add = TRUE)
plot(poland.map[poland.map$nazwa  == "podlaskie", ], col = kolor4, add = TRUE)
plot(poland.map[poland.map$nazwa  == "lubelskie", ], col = kolor4, add = TRUE)
plot(poland.map[poland.map$nazwa  == "podkarpackie", ], col = kolor4, add = TRUE)
plot(poland.map[poland.map$nazwa  == "pomorskie", ], col = kolor4, add = TRUE)
legend(123223.7,310000.6,  c("Grupa I",  "Grupa II",  "Grupa III",  "Grupa IV"),fill =c(kolor1,kolor2,kolor3,kolor4),bty = "n", title= "Legenda",cex = 0.75)
print(summary(poland.map))
