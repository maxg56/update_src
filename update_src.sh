#!/bin/bash

# Variables
SRC_DIR="./src"
SRC_MK="Sources.mk"
VAR_NAME="SRC_FILES :="

OS=$(uname)
macOS=false
[[ $OS == "Darwin" ]] && macOS=true

# Couleurs pour les messages
RED="\033[0;91m"
GREEN="\033[0;92m"
RESET="\033[0;39m"

# Vérifier si le répertoire source existe
if [[ ! -d "$SRC_DIR" ]]; then
    printf "${RED}Erreur : le répertoire source '%s' n'existe pas.${RESET}\n" "$SRC_DIR"
    exit 1
fi

# Trouver les fichiers sources
if [[ $macOS == true ]]; then
    SRC_FILES=$(find "$SRC_DIR" -type f \( -name "*.c" -o -name "*.m" \))
else
    SRC_FILES=$(find "$SRC_DIR" -type f -name "*.c")
fi

# Vérifier s'il y a des fichiers sources
if [[ -z "$SRC_FILES" ]]; then
    printf "${RED}Erreur : aucun fichier source trouvé dans '%s'.${RESET}\n" "$SRC_DIR"
    exit 1
fi

# Construire la ligne SRC_FILES
SRC_LINE="$VAR_NAME \\"
SRC_LINE+=$(echo "$SRC_FILES" | sed 's|^\./||' | sed 's| |\\ |g' | tr '\n' ' \\\\\n\t')

# Vérifier si le fichier src.mk existe
if [[ -f "$SRC_MK" ]]; then
    if [[ $macOS == true ]]; then
        sed -i "" "/^$VAR_NAME /c\\
$SRC_LINE" "$SRC_MK"
    else
        sed -i "/^$VAR_NAME /c $SRC_LINE" "$SRC_MK"
    fi
    printf "${GREEN}Le fichier '%s' a été mis à jour avec succès.${RESET}\n" "$SRC_MK"
else
    printf "${RED}Erreur : le fichier '%s' n'existe pas.${RESET}\n" "$SRC_MK"
    exit 1
fi
