#!/bin/bash

SRC_DIR="./src"
SRC_MK="Sources.mk" 
VAR_NAME="SRC_FILES :="

OS=$(uname)
if [[ $OS == "Darwin" ]]; then
    macOS=true
else
    macOS=false
fi
# Change à true si tu es sous macOS
#macOS=false


# Vérifier si le répertoire source existe
if [[ ! -d "$SRC_DIR" ]]; then
    printf "\033[0;91mErreur : le répertoire source %s n'existe pas.\n\033[0;39m" $SRC_DIR
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
    printf "\033[0;91mAucun fichier source trouvé dans %s.\n\033[0;39m" $SRC_DIR
    exit 1
fi

# Construire la ligne SRC_FILES
SRC_LINE="$VAR_NAME \\"
SRC_LINE+="$(echo "$SRC_FILES" | sed 's|^\./||' | sed 's| |\\ |g' | tr '\n' ' \\\\\n\t')"

# Debugging (optionnel)
DEBUG=true
if [[ $DEBUG == true ]]; then
    printf "%s :\n%s\nSRC_LINE:\n%s\n" "$VAR_NAME" "$SRC_FILES" "$SRC_LINE"
fi

# Vérifier si le fichier src.mk existe
if [[ -f "$SRC_MK" ]]; then
       if [[ $macOS == true ]]; then
        sed -i "" "/^$VAR_NAME /c $SRC_LINE" "$SRC_MK"
    else
        sed -i "/^$VAR_NAME /c $SRC_LINE" "$SRC_MK"
    fi
    printf "\033[0;92mLe fichier %s a été mis à jour.\n\033[0;39m" "$SRC_MK" 
else
    printf "\033[0;91m Erreur : le fichier %s n'existe pas.\n\033[0;39m" $SRC_MK
    exit 1
fi
