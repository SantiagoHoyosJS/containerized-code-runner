# Ejecución de Programas en Contenedores

## Descripción del Proyecto
Este proyecto consiste en el desarrollo de una aplicación que permite ejecutar programas escritos en diferentes lenguajes de programación dentro de contenedores Docker. La aplicación detecta automáticamente el lenguaje de programación según la extensión del archivo fuente, lo ejecuta en un contenedor específico y muestra tanto la salida del programa como el tiempo total de ejecución.

## Funcionalidades
- **Detección del lenguaje:** Identificación del lenguaje de programación basado en la extensión del archivo.
- **Ejecución en contenedores:** Lanzamiento de un contenedor Docker con el entorno adecuado para ejecutar el código.
- **Captura de resultados y medición de tiempo:** Se mide el tiempo total de ejecución y se captura la salida generada por el programa.
- **Manejo de errores:** Validaciones para asegurar que el archivo existe, que la extensión es válida y para gestionar errores durante la ejecución.

## Lenguajes Soportados
- Python (.py)
- Java (.java)
- C++ (.cpp, .cc)
- JavaScript (.js)
- Ruby (.rb)

## Requisitos
Para ejecutar esta aplicación, necesitas tener instalado:
- Docker

## Configuración y Ejecución
- Para ejecutar el programa por primera vez debe realizar los siguientes comandos:
```bash
git clone https://github.com/SantiagoHoyosJS/containerized-code-runner.git
cd containerized-code-runner && chmod +x script.sh  
./script.sh 
```
- Para volverlo a ejecutar solo debe usar el comando:
```bash
./script.sh 
``` 

## Ejemplo de Uso
### Entrada
```bash
Ingrese el nombre del archivo a ejecutar: sample.py
```
### Salida Esperada
```bash
Salida del programa:
0 1 1 2 3 5 8 ... (hasta 100 valores de Fibonacci)
Tiempo de ejecución: 5 ms
```

## Archivos de Prueba
Se incluyen archivos de prueba en cada lenguaje en la carpeta `samples/`:
- `sample.py`
- `sample.java`
- `sample.cpp`
- `sample.js`
- `sample.rb`

