# Instala y carga los paquetes necesarios:
install.packages(c("ape", "phangorn"))
library(ape)
library(phangorn)

# Lee los archivos .fas:
alineacion_bat <- read.dna("~/Proyecto Genómica/Fasta/Lyssavirus Bat.fas", format = "fasta")
alineacion_human <- read.dna("~/Proyecto Genómica/Fasta/Lyssavirus Human.fas", format = "fasta")
alineacion_human_bat <- read.dna("~/Proyecto Genómica/Fasta/Lyssavirus Human-bat.fas", format = "fasta")

# Convierte los datos de alineación a la clase phyDat:
alineacion_bat_phyDat <- phyDat(alineacion_bat)
alineacion_human_phyDat <- phyDat(alineacion_human)
alineacion_human_bat_phyDat <- phyDat(alineacion_human_bat)

# Inicializa los árboles con la función random.addition:
arbol_bat_inicial <- random.addition(alineacion_bat_phyDat)
arbol_human_inicial <- random.addition(alineacion_human_phyDat)
arbol_human_bat_inicial <- random.addition(alineacion_human_bat_phyDat)

# Optimiza los árboles para obtener la máxima parsimonía:
arbol_bat_parsimony <- optim.parsimony(arbol_bat_inicial, alineacion_bat_phyDat)
arbol_human_parsimony <- optim.parsimony(arbol_human_inicial, alineacion_human_phyDat)
arbol_human_bat_parsimony <- optim.parsimony(arbol_human_bat_inicial, alineacion_human_bat_phyDat)

# Visualiza los árboles:
plot(arbol_bat_parsimony)
plot(arbol_human_parsimony)
plot(arbol_human_bat_parsimony)
