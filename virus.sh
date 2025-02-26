#!/bin/bash
# virus.sh - Simulación de virus con Flappy Bird

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
