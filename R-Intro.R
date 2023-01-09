#####
# Definieren Sie Ihr Arbeitsverzeichnis als aktuelle Working Directory
# (entweder über das Files-Menü (rechts unten) oder mittels Kommando setwd(...) )
#####

setwd("~/Desktop/R-Dateien zur Vorlesung-20230109")

#####
# Laden Sie den Datensatz Alkoholkonsum.csv mittels read.csv2("Alkoholkonsum.csv")
# und speichern Sie ihn unter dem Namen alk
#####

alk <- read.csv2("files/Alkoholkonsum.csv")

#####
# Verschaffen Sie sich über die summary()-Funktion einen Überblick über den Datensatz
#####

summary(alk)

####
# Geben Sie über die dim()-Funktion die Anzahl der Zeilen / Spalten aus
####

dim(alk)

####
# Erstellen Sie mit der plot()-Funktion ein Streudiagramm für die beiden Variablen
# Wine und Heart Death Rate
####

plot(alk$Wine, alk$Heart.death.rate)

####
# Erstellen Sie mit der pairs()-Funktion eine Matrix aller Streudiagramme
# Hinweis: Nicht-numerische Variable Country auslassen
####

# Plottet alle Möglichkeiten, deshalb nur die Range der Spalten angeben (hier der gesamte Datensatz -1, da Country rausgelassen werden soll
pairs(alk[-1])

# Alternativ Spalten einzeln angeben:
#pairs(~alk$Heart.death.rate + alk$Liquor + alk$Wine + alk$Beer, data = alk)