library("sp")
library("rgdal")
encoding = "utf-8"

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
plot(europe.map[europe.map$NAME == "Ireland", ], col = "darkolivegreen1", add = TRUE)
plot(europe.map[europe.map$NAME == "Poland", ], col = "darkolivegreen1", add = TRUE)
plot(europe.map[europe.map$NAME == "Germany", ], col = "darkolivegreen4", add = TRUE)