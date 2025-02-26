#!/bin/bash
# virus.sh - Simulación de virus que lanza múltiples instancias de Flappy Bird
# ADVERTENCIA: Código 100% educativo. Ejecutar en entornos controlados.

# Función para lanzar Flappy Bird en el navegador predeterminado
lanzar_flappy() {
  if command -v xdg-open > /dev/null; then
    xdg-open flappy.html
  elif command -v open > /dev/null; then
    open flappy.html
  else
    echo "No se pudo abrir el navegador automáticamente."
  fi
}

echo "¡Tu sistema está infectado! 😈"
sleep 2

# Bucle principal: el usuario debe ingresar una puntuación de al menos 20 para salir.
while true; do
  # Lanzamos una nueva instancia del juego
  lanzar_flappy
  echo "Juega al Flappy Bird simulado. Debes alcanzar una puntuación mínima de 20 para poder salir."
  read -p "Ingresa tu puntuación: " score
  
  # Validamos que se haya ingresado un número y que sea mayor o igual a 20
  if [[ "$score" =~ ^[0-9]+$ ]] && [ "$score" -ge 20 ]; then
    echo "¡Felicidades! Has alcanzado la puntuación necesaria. Saliendo..."
    break
  else
    echo "Puntuación insuficiente. Se abrirá otra instancia de Flappy Bird..."
    sleep 1
  fi
done
