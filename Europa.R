library("sp")
library("rgdal")


europe.map <- readOGR(dsn="C:\\Users\\zemat\\Documents\\Rrr", "Europe")
print ("dane poprawnie wpisane do klasy europe.map")
class(europe.map)
print(ncol(europe.map@data))
print (typeof(europe.map$NAME))
print(head(europe.map@data))
#europe.map@data <- europe.map@data[ , c(0,1),stringsasfactors=False]
#print(summary(europe.map))
print (europe.map@data)


plot(europe.map)

print ("grupa 1")

kolor1 = "springgreen3"
plot(europe.map[europe.map$NAME == "Ireland", ], col = kolor1, add = TRUE)
plot(europe.map[europe.map$NAME == "Poland", ], col = kolor1, add = TRUE)

print ("grupa 2")

kolor2 = "dodgerblue2"
plot(europe.map[europe.map$NAME == "Czech Republic", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Slovakia", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Romania", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Spain", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Lativia", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Belgium", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Bulgaria", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "United Kingdom", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Finland", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Lithuania", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Estonia", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Slovenia", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Sweden", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Portugal", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Italy", ], col = kolor2, add = TRUE)
plot(europe.map[europe.map$NAME == "Netherlands", ], col = kolor2, add = TRUE)

print ("grupa 3")

kolor3 = "darkorange2"
plot(europe.map[europe.map$NAME == "Greece", ], col = kolor3, add = TRUE)
plot(europe.map[europe.map$NAME == "Cyprus", ], col = "red", add = TRUE) # nie ma cypru w tej mapie
plot(europe.map[europe.map$NAME == "Croatia", ], col = kolor3, add = TRUE)
plot(europe.map[europe.map$NAME == "Malta", ], col = kolor3, add = TRUE) # tak samo jak malty
plot(europe.map[europe.map$NAME == "Luxembourg", ], col = kolor3, add = TRUE)
plot(europe.map[europe.map$NAME == "Austria", ], col = kolor3, add = TRUE)

print ("grupa 4")

kolor4 = "purple"
plot(europe.map[europe.map$NAME == "Germany", ], col = kolor4, add = TRUE)
plot(europe.map[europe.map$NAME == "Hungary", ], col = kolor4, add = TRUE)
plot(europe.map[europe.map$NAME == "France", ], col = kolor4, add = TRUE)
plot(europe.map[europe.map$NAME == "Denmark", ], col = kolor4, add = TRUE)
#plot(europe.map[europe.map$NAME == "Faeroe Islands (Denmark) ", ], col = "red", add = TRUE)
#plot(europe.map[europe.map$NAME == "Faeroe Islands", ], col = "red", add = TRUE)
#plot(europe.map[europe.map$NAME == "Faeroe Islands (Denmark)", ], col = "red", add = TRUE)