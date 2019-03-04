# deklaracja biblioteki 
#library("sp")
library("stringr")
# hotfix do polskiej czcionki

Sys.setlocale("LC_CTYPE", "polish")
# Czytanie pliku
plik = "./Arkusze/Rankingi csv/Doktorat_obliczenia_EU-28_mediana_wzorzec.csv"
df <- read.csv(plik, header = TRUE, encoding = "UTF-8")

# zmienne pomocnicze
lista <- 0:28
x <- c(0,df$dobre_zi[1:28])
#x2 <- c(0,df$Patenty.związane.z.recyklingiem.i.surowcami.wtórnymi...liczba.[1:28]) #patenty
Biomasa <- c(0,df$Dobra_biomasa[1:28]) 
Patenty <- c(0,df$Dobre_patenty[1:28]) 
y = lista
Średnia = mean(df$dobre_zi[1:28])
Odch.st = sd(df$dobre_zi[1:28])

Punkt1 = Średnia + Odch.st
Punkt2 = Średnia - Odch.st

# Przydzielenie skrótów do państw
Państwa <- df$dobry_wzorzec
Państwa %<>%
  gsub("Belgia", "BE", .) %>% gsub("Szwecja", "SE", .) %>% gsub("Bułgaria", "BG", .) %>% gsub("Chorwacja", "HR", .) %>% 
  gsub("Austria", "AT", .) %>% gsub("Cypr", "CY", .) %>% gsub("Czechy", "CZ", .) %>% gsub("Dania", "DK", .) %>%
  gsub("Słowacja", "SK", .) %>% gsub("Estonia", "EE", .) %>% gsub("Finlandia", "FI", .) %>% gsub("Francja", "FR", .) %>%
  gsub("Grecja", "GR", .) %>% gsub("Hiszpania", "ES", .) %>% gsub("Holandia", "NL", .) %>% gsub("Irlandia", "IE", .) %>%
  gsub("Litwa", "LT", .) %>% gsub("Luksemburg", "LU", .) %>% gsub("Łotwa", "LV", .) %>% gsub("Malta", "MT", .) %>%
  gsub("Niemcy", "DE", .) %>% gsub("Polska", "PL", .) %>% gsub("Portugalia", "PO", .) %>% gsub("Rumunia", "RO", .) %>%
  gsub("Słowenia", "SI", .) %>% gsub("Węgry", "HU", .) %>% gsub("Wielka Brytania", "GB", .) %>% gsub("Włochy", "IT", .)

Państwa_Patenty <- df$Czerwone_kraje
Państwa_Patenty %<>%
  gsub("Belgia", "BE", .) %>% gsub("Szwecja", "SE", .) %>% gsub("Bułgaria", "BG", .) %>% gsub("Chorwacja", "HR", .) %>% 
  gsub("Austria", "AT", .) %>% gsub("Cypr", "CY", .) %>% gsub("Czechy", "CZ", .) %>% gsub("Dania", "DK", .) %>%
  gsub("Słowacja", "SK", .) %>% gsub("Estonia", "EE", .) %>% gsub("Finlandia", "FI", .) %>% gsub("Francja", "FR", .) %>%
  gsub("Grecja", "GR", .) %>% gsub("Hiszpania", "ES", .) %>% gsub("Holandia", "NL", .) %>% gsub("Irlandia", "IE", .) %>%
  gsub("Litwa", "LT", .) %>% gsub("Luksemburg", "LU", .) %>% gsub("Łotwa", "LV", .) %>% gsub("Malta", "MT", .) %>%
  gsub("Niemcy", "DE", .) %>% gsub("Polska", "PL", .) %>% gsub("Portugalia", "PO", .) %>% gsub("Rumunia", "RO", .) %>%
  gsub("Słowenia", "SI", .) %>% gsub("Węgry", "HU", .) %>% gsub("Wielka Brytania", "GB", .) %>% gsub("Włochy", "IT", .)

Państwa_Biomasa <- df$Zielone_kraje
Państwa_Biomasa %<>%
  gsub("Belgia", "BE", .) %>% gsub("Szwecja", "SE", .) %>% gsub("Bułgaria", "BG", .) %>% gsub("Chorwacja", "HR", .) %>% 
  gsub("Austria", "AT", .) %>% gsub("Cypr", "CY", .) %>% gsub("Czechy", "CZ", .) %>% gsub("Dania", "DK", .) %>%
  gsub("Słowacja", "SK", .) %>% gsub("Estonia", "EE", .) %>% gsub("Finlandia", "FI", .) %>% gsub("Francja", "FR", .) %>%
  gsub("Grecja", "GR", .) %>% gsub("Hiszpania", "ES", .) %>% gsub("Holandia", "NL", .) %>% gsub("Irlandia", "IE", .) %>%
  gsub("Litwa", "LT", .) %>% gsub("Luksemburg", "LU", .) %>% gsub("Łotwa", "LV", .) %>% gsub("Malta", "MT", .) %>%
  gsub("Niemcy", "DE", .) %>% gsub("Polska", "PL", .) %>% gsub("Portugalia", "PO", .) %>% gsub("Rumunia", "RO", .) %>%
  gsub("Słowenia", "SI", .) %>% gsub("Węgry", "HU", .) %>% gsub("Wielka Brytania", "GB", .) %>% gsub("Włochy", "IT", .)

Państwa <- Państwa[1:28]
Państwa_Patenty <- Państwa_Patenty[1:28]
Państwa_Biomasa <- Państwa_Biomasa[1:28]

regexy <- gsub(".csv", "", plik) %>% gsub("./Arkusze/Rankingi/", "", .)

png(filename = paste0("./Wyniki/Wzorzec_vs_Biomasa_vs_Patenty/", regexy, ".png"),
    width = 1000, height = 770, units = "px")


# plotowanie
plot(y, x, col=ifelse(x==0, "white", "black"), xlab="Ranking position", ylab="Artificial development indicator",
     pch=0, xaxt="n", yaxt="n",cex= 2, xlim = c(1,28),ylim = c(0,1), par(mar=c(35,35,0,0)))
#plot(x2, y, col=ifelse(x2==0, "white", "red"), xlab="Wartość syntetycznego miernika ekorozowju", ylab="Pozycja w rankingu ", pch=19, xaxt="n", yaxt="n")
points(y,Biomasa, col=ifelse(x==0, "white", "black"),cex= 2.5,  pch=1)
points(y,Patenty, col=ifelse(x==0, "white", "black"),cex= 2, pch=2)

# zmienna pomocnicza
axis_seqx <- seq(0, 28, length.out = 29)
axis_seqy <- seq(0, 1, length.out = 11)

# zmiana osia
axis(side=1,at=axis_seqx,lwd=1)
axis(side=2,at=axis_seqy,lwd=1)
# linie 
abline(h = Średnia, col = "gray60", lwd = 2, lty = 2)
abline(h = Punkt1, col = "gray60", lwd = 2, lty = 2)
abline(h = Punkt2, col = "gray60", lwd = 2, lty = 2)

# Znaczniki dla linii
mtext(expression(bar("Z") -"S"[d]), line = 0.5, at = Punkt1, side = 4, las = 1)
mtext(expression(bar("Z") + "S"[d]), line = 0.5, at = Punkt2, side = 4, las = 1)
mtext(expression(bar("Z")), line = 0.5, at = Średnia, side = 4, las = 1)

# wygładzenie pomocnicze
#scatter.smooth(x[1:29], y[1:29])
# regresja liniowa

legend("bottomleft", legend=c("Patenty", "Mediana", "Biomasa"),
       col=c("black", "black", "black"),bty = "n", pch = c(2,0,1), cex=0.9)

#linear_model = lm(y~x,data=df)

#abline(linear_model)
text(y[2:29],x[2:29], labels=Państwa, cex= 0.8, pos=3,col = "black")

text(y[2:29],Biomasa[2:29], labels=Państwa_Biomasa, cex= 0.8,  pos=ifelse(y==4, 2, 3), col = "black") # pos=ifelse(Biomasa<0.017933208, 2, 3)
text(y[2:29],Patenty[2:29], labels=Państwa_Patenty, cex= 0.8,  pos=4, col = "black")


dev.off()
