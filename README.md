# Virus Flappy Bird 😈

Este proyecto es un **script de virus simulado** que utiliza un juego de Flappy Bird en HTML5 como medio de interacción. El objetivo del virus es abrir múltiples instancias del juego hasta que el usuario alcance una **puntuación mínima de 20**. Si no se logra la puntuación, el juego se reinicia indefinidamente, saturando la pantalla con ventanas del navegador.

---

## Funcionalidades

El virus simula un comportamiento malicioso sin dañar el sistema. Incluye las siguientes funcionalidades:

1. **Payload Simulado**: 
   - Crea un archivo temporal (`/tmp/infectado.txt`) que se inunda con texto aleatorio.
2. **Propagación Simulada**: 
   - Copia el script en otra carpeta (`Documents/Infectados`).
3. **Persistencia Simulada**: 
   - En **Linux**: Modifica `~/.bashrc`.
   - En **Windows**: Agrega una entrada en el registro para que se ejecute al iniciar el sistema.
4. **Ofuscación**: 
   - Codifica parte del script en Base64 y lo decodifica en tiempo de ejecución.
5. **Autodestrucción**: 
   - Elimina el propio script después de que se alcance la puntuación requerida.

---

## Requisitos

### Linux
- **Dependencias**: 
    - `curl`, `unzip`, `xdg-utils`
    ```bash
    sudo apt update && sudo apt install curl unzip xdg-utils
    ```

- **Navegadores Compatibles**:
    - **Firefox** o **Google Chrome**

### Windows
- **Entorno**: 
    - Utilizar **Git Bash** o **WSL**.
- **Navegadores Compatibles**:
    - **Google Chrome** o **Firefox**

---

## Instalación y Ejecución

### 1. Clonar el Repositorio

```bash
git clone <URL_DE_TU_REPOSITORIO>
cd <NOMBRE_DEL_REPOSITORIO>
