#! /bin/bash
# Estudiante: Esteban Moroy
# Número de Estudiante: 338885

# Archivo de usuarios y contraseñas
ARCHIVO_USUARIOS="usuarios.txt"
echo "admin:admin" > $ARCHIVO_USUARIOS
echo "jperez:contraseña" >> $ARCHIVO_USUARIOS
echo "gbeder:intrepido_" >> $ARCHIVO_USUARIOS
echo "lrodriguez:elstreamer123" >> $ARCHIVO_USUARIOS
echo "amontes:pincha2009" >> $ARCHIVO_USUARIOS

# Variables para almacenar las letras de inicio, fin, contenida y vocal
letra_inicio=""
letra_final=""
letra_contenida=""
vocal=""
ARCHIVO_DICCIONARIO="diccionario.txt"

autenticar_usuario() {
    echo "Ingrese usuario:"
    read usuario
    echo "Ingrese contraseña:"
    read -s contrasena #Se usa -s para que la entrada sea "silenciosa", es decir que no muestre lo que se escribe
    grep -q "$usuario:$contrasena" $ARCHIVO_USUARIOS #Se usa -q para que la salida de grep sea "silenciosa"
    return $? #Devuelve el resultado de la última linea ejecutada
}

menu_principal(){
    echo ""
    echo "MENÚ PRINCIPAL"
    echo "1. Listar usuarios registrados"
    echo "2. Dar de alta usuario"
    echo "3. Configurar letra de inicio"
    echo "4. Configurar letra de fin"
    echo "5. Configurar letra contenida"
    echo "6. Consultar diccionario"
    echo "7. Ingresar vocal"
    echo "8. Listar palabras con vocal"
    echo "9. Algoritmo 1: Número mayor y menor"
    echo "10. Algoritmo 2: Palabra capicúa"
    echo "11. Salir"

    read -p "Ingrese una opción del 1 al 11: " opcion

    case $opcion in
        1) listar_usuarios_registrados;;
        2) alta_usuario;;
        3) configurar_letra_de_inicio;;
        4) configurar_letra_de_fin;;
        5) configurar_letra_contenida;;
        6) consultar_diccionario;;
        7) ingresar_vocal;;
        8) listar_palabras_con_vocal;;
        9) algoritmo_1;;
        10) algoritmo_2;;
        11) exit 0;;
        *) echo "Opción inválida, por favor elegir una opción entre 1 y 11";;
    esac
}

listar_usuarios_registrados() {
    echo "Listado de usuarios registrados"
    grep -E -o '^[^:]+' $ARCHIVO_USUARIOS #Se usa -E para interprete el regex y -o para que muestre solo la parte que coincide
}

alta_usuario() {
    echo "Ingrese el nombre de usuario:"
    read nuevo_usuario
    echo "Ingrese la contraseña del nuevo usuario:"
    read -s nueva_contrasena
    # Revisa si el usuario ya está registrado
    if grep -q "^$nuevo_usuario:" $ARCHIVO_USUARIOS; then
        echo "El usuario ya está registrado"
    else
        echo "$nuevo_usuario:$nueva_contrasena" >> $ARCHIVO_USUARIOS
        echo "Usuario agregado exitosamente"
    fi
}

configurar_letra_de_inicio() {
    echo "Ingrese la letra de inicio:"
    read letra_inicio
}

configurar_letra_de_fin() {
    echo "Ingrese la letra de fin:"
    read letra_final
}

configurar_letra_contenida() {
    echo "Ingrese la letra contenida:"
    read letra_contenida
}

consultar_diccionario() {
    local consulta=$(grep -E "^${letra_inicio}.*[${letra_contenida}].*${letra_final}$" $ARCHIVO_DICCIONARIO)
    echo "Palabras encontradas:"
    echo $consulta
    # Fecha de ejecutado el informe
    echo "Fecha de ejecución: $(date +"%D")" > informe.txt
    # Cantidad de palabras totales
    echo "Cantidad de palabras totales consulta: $(echo $consulta | wc -w)" >> informe.txt
    # Cantidad de palabras de todo el diccionario
    local total_diccionario=$(wc -w $ARCHIVO_DICCIONARIO | awk '{print $1}') #Se usa awk para imprimir solo la cantidad de palabras y que no me traiga el nombre del archivo
    echo "Cantidad de palabras totales en diccionario: $total_diccionario" >> informe.txt
    # Porcentaje de palabras del diccionario que cumplen lo pedido.
    echo "El porcentaje de palabras del diccionario que cumplen con lo pedido es: $(awk "BEGIN {printf \"%.2f\", ($(echo $consulta | wc -w) / $total_diccionario) * 100}")%" >> informe.txt
    # Se usa printf en lugar de print para poder parametrizar los decimales del output con %.2f
    # Se usa BEGIN para que awk ejecute el bloque de código encasulado en {} antes que el resto

    # Nombre de usuario registrado a la hora de guardar el script.
    echo "Usuario registrado: $usuario" >> informe.txt
    echo "Informe generado bajo el nombre informe.txt"
}

ingresar_vocal() {
    echo "Ingrese la vocal:"
    read vocal
    while [[ ! $vocal =~ ^[aeiou]$ ]]; do #Se usa =~ para comparar con regex
        echo "Error: Ingrese una vocal válida (a, e, i, o, u)"
        read vocal
    done
}

listar_palabras_con_vocal() {
    otras_vocales=$(echo "aeiou" | sed s/$vocal//) #Se usa sed para reemplazar la vocal ingresada por el caracter vacío
    grep -E -i "^.*[$vocal].*$" $ARCHIVO_DICCIONARIO | grep -E -i "^[^$otras_vocales]*$"
    #Se usa -i para que sea insensible a mayúsculas y minúsculas
    #Primero se filtran las palabras que contienen la vocal ingresada, luego se le pasa el resultado al segundo grep para que filtre las palabras que no contienen las otras vocales
}

algoritmo_1() {
    # El sistema pregunta cuantos datos desea ingresar.
    # Luego de leer la respuesta, el sistema comienza a pedir dichos datos (enteros).
    # Finalmente, devuelve el promedio de los datos ingresados, el menor y mayor dato ingresado.
    echo "Ingrese la cantidad de datos:"
    read cantidad
    suma=0
    minimo=0
    maximo=0
    for ((i=0; i<cantidad; i++)); do
        echo "Ingrese el dato $((i + 1)):"
        read numero
        suma=$((suma + numero))
        if [[ $i -eq 0 || $numero -lt $minimo ]]; then
            minimo=$numero
        fi
        if [[ $i -eq 0 || $numero -gt $maximo ]]; then
            maximo=$numero
        fi
    done
    promedio=$((suma / cantidad))
    echo "Promedio: $promedio"
    echo "Mínimo: $minimo"
    echo "Máximo: $maximo"
}

algoritmo_2() {
    # El usuario ingresa una palabra y el programa devuelve si la misma es capicúa o no.
    echo "Ingrese una palabra:"
    read palabra
    if [[ $(echo $palabra | rev) == $palabra ]]; then
        echo "La palabra es capicúa"
    else
        echo "La palabra no es capicúa"
    fi
}

if autenticar_usuario; then
    echo "Autenticación exitosa"
    while true; do
        menu_principal
    done
else
    echo "Error de autenticación"
fi
