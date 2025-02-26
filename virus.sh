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
    echo "Puntuación insuficiente. Se abrirá otra instancia de Flappy Bird..."
    sleep 1
  fi
done
