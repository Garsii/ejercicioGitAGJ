#!/bin/bash
# virus.sh - Simulación de virus que lanza múltiples instancias de Flappy Bird
# ADVERTENCIA: Código 100% educativo. Ejecutar en entornos controlados.
#
# Este script abre el archivo flappy.html en el navegador y solicita al usuario
# alcanzar una puntuación mínima de 20. Si la puntuación no es suficiente, se abre
# una nueva pestaña con el juego, simulando la "infección" del sistema.

# Función para abrir flappy.html en el navegador predeterminado
lanzar_flappy() {
  if command -v xdg-open > /dev/null; then
    xdg-open flappy.html  # Utilizado en Linux
  elif command -v open > /dev/null; then
    open flappy.html  # Utilizado en macOS
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

echo "¡Tu sistema está infectado! 😈"
sleep 2

# Bucle principal: se solicita al usuario ingresar una puntuación.
# El juego se repite hasta que se ingrese un valor numérico mayor o igual a 20.
while true; do
  lanzar_flappy
  echo "Juega al Flappy Bird simulado. Debes alcanzar una puntuación mínima de 20 para poder salir."
  read -p "Ingresa tu puntuación: " score
  
  # Se verifica que el input sea numérico y que cumpla con la condición mínima
  if [[ "$score" =~ ^[0-9]+$ ]] && [ "$score" -ge 20 ]; then
    echo "¡Felicidades! Has alcanzado la puntuación necesaria. Saliendo..."
    break
  else
     echo "Puntuación insuficiente. Ejecutando Payload Simulado..."
     payload_simulado
     sleep 1
  fi
done
