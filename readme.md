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
Antes de ejecutar la aplicación, asegúrate de tener instalado:
- Docker

## Configuración y Ejecución
- Para ejecutar el programa por primera vez, usa los siguientes comandos:
```bash
git clone https://github.com/SantiagoHoyosJS/containerized-code-runner.git
cd containerized-code-runner && chmod +x script.sh  
./script.sh 
```
- Para volver a ejecutar la aplicación, simplemente usa:
```bash
./script.sh 
``` 

## Ejemplo de Uso

```bash
$ ./script.sh
Ingrese la ruta del archivo de código fuente: sample.py
Preparando entorno...
Ejecutando el programa en un contenedor Docker...
--- Salida del programa ---
0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765 10946 17711 28657 46368 75025 121393 196418 317811 514229 832040 1346269 2178309 3524578 5702887 9227465 14930352 24157817 39088169 63245986 102334155 165580141 267914296 433494437 701408733 1134903170 1836311903 2971215073 4807526976 7778742049
Tiempo de ejecución: 40.926 ms
--------------------------------
```

## Archivos de Prueba  

Se incluyen archivos de prueba en cada lenguaje, los cuales calculan los 50 primeros términos de la serie de Fibonacci:  

- `sample.py`  
- `sample.java`  
- `sample.cpp`  
- `sample.cc`  
- `sample.js`  
- `sample.rb`  


## **Consideraciones Especiales**  

- Si se va a ejecutar un programa en **Java**, y este contiene una **clase pública**, el nombre de la clase debe coincidir exactamente con el nombre del archivo.  
  - **Ejemplo:** Si el archivo se llama `Main.java`, la clase pública dentro del archivo debe declararse como:  

    ```java
    public class Main {
        public static void main(String[] args) {
            System.out.println("Hola, mundo!");
        }
    }
    ```

## Miembros del grupo  

- Santiago Hoyos 
- Jesús Cabrera  


