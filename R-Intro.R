#####
# Definieren Sie Ihr Arbeitsverzeichnis als aktuelle Working Directory
# (entweder über das Files-Menü (rechts unten) oder mittels Kommando setwd(...) )
#####

setwd("~/Desktop/R-Dateien zur Vorlesung-20230109")

#####
# Laden Sie den Datensatz Alkoholkonsum.csv mittels read.csv2("Alkoholkonsum.csv")
# und speichern Sie ihn unter dem Namen alk
#####

# Anstatt von <- kann auch = verwendet werden
alk <- read.csv2("files/Alkoholkonsum.csv")
head(alk)

#####
# Verschaffen Sie sich über die summary()-Funktion einen Überblick über den Datensatz
#####

summary(alk)

####
# Geben Sie über die dim()-Funktion die Anzahl der Zeilen / Spalten aus
####

dim(alk)

# Andere Möglichkeiten für Informationen zum Datensatz:
nrow(alk)
ncol(alk)
str(alk)

####
# Erstellen Sie mit der plot()-Funktion ein Streudiagramm für die beiden Variablen
# Wine und Heart Death Rate
####

# Durch attach muss nicht mehr immer alk angegeben werden
attach(alk)
plot(alk$Wine, alk$Heart.death.rate)

####
# Erstellen Sie mit der pairs()-Funktion eine Matrix aller Streudiagramme
# Hinweis: Nicht-numerische Variable Country auslassen
####

# Plottet alle Möglichkeiten, deshalb nur die Range der Spalten angeben (hier der gesamte Datensatz -1, da Country rausgelassen werden soll
# Eckige Klammern auf einzelne Datensätze mit [Zeilen, Spalte] hinzufügen
pairs(alk[,-1])

# Alternativ Spalten einzeln angeben:
#pairs(~alk$Heart.death.rate + alk$Liquor + alk$Wine + alk$Beer, data = alk)