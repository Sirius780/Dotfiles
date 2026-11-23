#!/usr/bin/env bash

# Lista de archivos o carpetas a ignorar
IGNORAR=(
    "scripts/*"
    "README.md"
    "LICENSE"
)

cd "$(dirname "$0")" || exit
cd "$(git rev-parse --show-toplevel)" || exit

git ls-files | while IFS= read -r file; do

    # Comprueba si el archivo coincide con algo de la lista
    for patron in "${IGNORAR[@]}"; do
        [[ "$file" == $patron ]] && continue 2
    done

    mkdir -p "$HOME/$(dirname "$file")"
    ln -sf "$PWD/$file" "$HOME/$file"

done
