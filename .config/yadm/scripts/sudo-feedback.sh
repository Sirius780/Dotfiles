#!/usr/bin/env bash

# Detiene el script si algo falla
set -e

# Comprueba si el archivo existe
if [ ! -f /etc/sudoers.d/90-sudo-asterisks ]; then
    echo "Añadiendo asteriscos para sudo..."
    
    # Inyectar usando sudo de forma explícita para todo el bloque
    sudo sh -c "echo 'Defaults:$(whoami) pwfeedback' > /etc/sudoers.d/90-sudo-asterisks"
    
    # Aplicar permisos hiper-estrictos obligatorios
    sudo chmod 0440 /etc/sudoers.d/90-sudo-asterisks
    
    # borra el cache antiguo de sudo para forzar la lectura del nuevo archivo
    sudo -k
    echo "✔ Configuración completada con exito"
else
    echo "✔ Los asteriscos de sudo ya estaban activados"
fi
