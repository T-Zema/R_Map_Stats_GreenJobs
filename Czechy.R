library("sp")
library("rgdal")


Czechy.map <- readOGR(dsn=".\\Pliki_shapefile", "CZE_adm1")
print ("dane poprawnie wpisane do klasy europe.map")
class(Czechy.map)
print(ncol(Czechy.map@data))
print (typeof(Czechy.map$VARNAME_1))
print(Czechy.map@data)

plot(Czechy.map)
plot(Czechy.map[Czechy.map$VARNAME_1 == "Reichenberg| Liberec", ], col = "darkolivegreen4", add = TRUE)