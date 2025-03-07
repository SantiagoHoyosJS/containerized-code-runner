#!/bin/bash

echo -n "Ingrese la ruta del archivo de código fuente: "
read FILE

# Verifica si el archivo existe
if [[ ! -f "$FILE" ]]; then
    echo "El archivo no existe."
    exit 1
fi
EXTENSION="${FILE##*.}"

# Reconoce el leguaje y el docker que se va a usar
case "$EXTENSION" in
    py)
        IMAGE="python:3"
        COMMAND="python /code/$(basename "$FILE")"
        ;;
    java)
        IMAGE="openjdk:latest"
        CLASSNAME=$(basename "$FILE" .java)
        COMMAND="cd /code && javac $CLASSNAME.java && if [ -f $CLASSNAME.class ]; then java -cp /code $CLASSNAME; else echo 'Error: Fallo la compilación de Java'; exit 1; fi"
        ;;
    cpp|cc)
        IMAGE="gcc:latest"
        EXECUTABLE=$(basename "$FILE" .$EXTENSION)
        COMMAND="g++ /code/$FILE -o /code/$EXECUTABLE && /code/$EXECUTABLE"
        ;;
    js)
        IMAGE="node:latest"
        COMMAND="node /code/$(basename "$FILE")"
        ;;
    rb)
        IMAGE="ruby:latest"
        COMMAND="ruby /code/$(basename "$FILE")"
        ;;
    *)
        echo "La extensión del archivo no está soportada."
        exit 1
        ;;
esac

# Obtiene la ruta de trabajo actual
WORKDIR=$(pwd)

# Verifica si Docker está en ejecución
docker info > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo "Docker no está en ejecución o no está instalado."
    exit 1
fi

# Descarga la imagen
echo "Preparando entorno..."
docker pull "$IMAGE" > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo "No se pudo descargar la imagen de Docker $IMAGE."
    exit 1
fi

# Ejecuta el código en el contenedor y medir el tiempo directamente dentro de este
echo "Ejecutando el programa en un contenedor Docker..."
OUTPUT=$(docker run --rm -v "${WORKDIR}:/code" -w /code "$IMAGE" bash -c "START=\$(date +%s%6N); $COMMAND; EXITCODE=\$?; END=\$(date +%s%6N); TOTAL_TIME=\$((END - START)); MILI=\$((TOTAL_TIME / 1000)); MICRO=\$((TOTAL_TIME % 1000)); echo \"Tiempo de ejecución: \$MILI.\$MICRO ms\"; exit \$EXITCODE" 2>&1)

# Captura el código de salida del contenedor
EXITCODE=$?

# Verifica si hubo errores en la ejecución
if [[ $EXITCODE -ne 0 ]]; then
    echo "El programa dentro del contenedor falló con código de salida $EXITCODE."
    exit $EXITCODE
else
  echo "--- Salida del programa ---"
  echo "$OUTPUT"
  echo "----------------------------"
fi