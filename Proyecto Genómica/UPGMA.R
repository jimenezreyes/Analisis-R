# Instala y carga los paquetes necesarios:
install.packages(c("ape", "phangorn"))
library(ape)
library(phangorn)

# Lee los archivos .fas:
alineacion_bat <- read.dna("~/Proyecto Genómica/Fasta/Lyssavirus Bat.fas", format = "fasta")
alineacion_human <- read.dna("~/Proyecto Genómica/Fasta/Lyssavirus Human.fas", format = "fasta")
alineacion_human_bat <- read.dna("~/Proyecto Genómica/Fasta/Lyssavirus Human-bat.fas", format = "fasta")

# Calcula las matrices de distancias:
distancia_bat <- dist.dna(alineacion_bat)
distancia_human <- dist.dna(alineacion_human)
distancia_human_bat <- dist.dna(alineacion_human_bat)

# Construye los árboles filogenéticos con UPGMA:
arbol_bat <- upgma(distancia_bat)
arbol_human <- upgma(distancia_human)
arbol_human_bat <- upgma(distancia_human_bat)

# Visualiza los árboles:
plot(arbol_bat)
plot(arbol_human)
plot(arbol_human_bat)
