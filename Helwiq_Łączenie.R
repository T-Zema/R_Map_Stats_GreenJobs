# deklaracja biblioteki 
#library("sp")
library("stringr")
# hotfix do polskiej czcionki

Sys.setlocale("LC_CTYPE", "polish")
# Czytanie pliku
df <- read.csv(".\\Arkusze\\Rankingi csv\\Doktorat_obliczenia_EU-28_2006_wzorzec.csv", header = TRUE, encoding = "UTF-8")

# zmienne pomocnicze
lista <- 0:28
x <- c(0,df$zi.1[1:28])
x2 <- c(0,df$Patenty.związane.z.recyklingiem.i.surowcami.wtórnymi...liczba.[1:28])
y = lista
Średnia = mean(df$zi.1[1:28])
Odch.st = sd(df$zi.1[1:28])
Punkt1 = Średnia + Odch.st
Punkt2 = Średnia - Odch.st

# Przydzielenie skrótów do państw
Państwa <- df$wzorzec
Państwa %<>%
     gsub("Belgia", "BE", .) %>% gsub("Szwecja", "SE", .) %>% gsub("Bułgaria", "BG", .) %>% gsub("Chorwacja", "HR", .) %>% 
     gsub("Austria", "AT", .) %>% gsub("Cypr", "CY", .) %>% gsub("Czechy", "CZ", .) %>% gsub("Dania", "DK", .) %>%
     gsub("Słowacja", "SK", .) %>% gsub("Estonia", "EE", .) %>% gsub("Finlandia", "FI", .) %>% gsub("Francja", "FR", .) %>%
     gsub("Grecja", "GR", .) %>% gsub("Hiszpania", "ES", .) %>% gsub("Holandia", "NL", .) %>% gsub("Irlandia", "IE", .) %>%
     gsub("Litwa", "LT", .) %>% gsub("Luksemburg", "LU", .) %>% gsub("Łotwa", "LV", .) %>% gsub("Malta", "MT", .) %>%
     gsub("Niemcy", "DE", .) %>% gsub("Polska", "PL", .) %>% gsub("Portugalia", "PO", .) %>% gsub("Rumunia", "RO", .) %>%
     gsub("Słowenia", "SI", .) %>% gsub("Węgry", "HU", .) %>% gsub("Wielka Brytania", "GB", .) %>% gsub("Włochy", "IT", .)
Państwa <- Państwa[1:28]
# plotowanie
plot(x, y, col=ifelse(x==0, "white", "blue"), xlab="Wartość syntetycznego miernika ekorozowju", ylab="Pozycja w rankingu ", pch=19, xaxt="n", yaxt="n",cex= 2)
#plot(x2, y, col=ifelse(x2==0, "white", "red"), xlab="Wartość syntetycznego miernika ekorozowju", ylab="Pozycja w rankingu ", pch=19, xaxt="n", yaxt="n")
points(x2,y, col=ifelse(x==0, "white", "red"),cex= 2)

  # zmienna pomocnicza
  axis_seqx <- seq(0, 1, length.out = 11)
  axis_seqy <- seq(0, 28, length.out = 29)
  title("wyniki wzorca vs patenty, czerwone to Patenty")
  # zmiana osi
  axis(side=1,at=axis_seqx,lwd=1)
  axis(side=2,at=axis_seqy,lwd=1)
  # linie 
  abline(v = Średnia, col = "gray60", lwd = 2, lty = 2)
  abline(v = Punkt1, col = "gray60", lwd = 2, lty = 2)
  abline(v = Punkt2, col = "gray60", lwd = 2, lty = 2)
  
  # Znaczniki dla linii
  mtext(expression(bar("Z") -"S"[d]), line = 0, at = Punkt1)
  mtext(expression(bar("Z") + "S"[d]), line = 0, at = Punkt2)
  mtext(expression(bar("Z")), line = 0.2, at = Średnia)
  
  # wygładzenie pomocnicze
  #scatter.smooth(x[1:29], y[1:29])
  # regresja liniowa
  
  linear_model = lm(y~x,data=df)
  
  #abline(linear_model)
  text(x[2:29],y[2:29], labels=Państwa, cex= 0.7, pos=3)
  text(x2[2:29],y[2:29], labels=Państwa, cex= 0.7,  pos=3, col = "red")
  summary(linear_model)
  summary(linear_model$coefficients)
  