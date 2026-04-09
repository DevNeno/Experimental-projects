#!/bin/bash

# INTERFAZ
CLI=1
MENU=0
CONFIG=0

# OPCIONES
VERBOSE=0
LOG=0
SUBCARPETA=0
REGISTRARCRON=0

# VARIABLES
origen=''
destino=''
log_file=''

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Uso: $0 [opciones] origen destino"
    echo
    echo "Este script hace una copia de seguridad de un directorio guardandola en un archivo comprimido .tar.gz."
    echo
    echo "Opciones:"
    echo "  -h, --help    Mostrar esta ayuda"
    echo "  -v, --verbose Mostrar información detallada durante la ejecucion"
	echo "  -l, Generar log durante la ejecucion"
	echo "  -sc, Incluir sub carpetas"
    exit 0
fi

if [ "$1" == "--version" ]; then
	echo "Version: 1.0"
	exit 0
fi

# ###################################################################
# #########################[R E S P A L D O]#########################
# ###################################################################

generar_respaldo(){
	verificar_igualdad
	timeStamp=$(date +"%m-%d-%y|%H-%M-%S")
	if [ "$LOG" -eq 1 ]; then
		logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
		echo "TOMANDO HORA DEL SISTEMA" "[$logTimeStamp]" >> "$log_file"
	fi
	if [ "$VERBOSE" -eq 1 ]; then
		echo "TOMANDO HORA DEL SISTEMA"
	fi
	carpetaRespaldo="Respaldo-$timeStamp"
	mkdir -p "$destino""$carpetaRespaldo"
	if [ "$LOG" -eq 1 ]; then
		logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
		echo "GENERANDO CARPETA DE RESPALDO" "[$logTimeStamp]" >> "$log_file"
		logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
		echo "RESPALDANDO CARPETA DESTINO EN CARPETA ORIGEN..." "[$logTimeStamp]" >> "$log_file"
	fi
	if [ "$VERBOSE" -eq 1 ]; then
		echo "GENERANDO CARPETA DE RESPALDO"
		echo "RESPALDANDO CARPETA DESTINO EN CARPETA ORIGEN..."
	fi
	if [ $SUBCARPETA -eq 1 ]; then
		if [ "$LOG" -eq 1 ]; then
			logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
			echo "INCLUYENDO SUBCARPETAS..." "[$logTimeStamp]" >> "$log_file"
		fi
		if [ "$VERBOSE" -eq 1 ]; then
			echo "INCLUYENDO SUBCARPETAS..."
		fi
		cp -a "$origen" "$destino""$carpetaRespaldo"
	else
		cp -p "$origen"* "$destino""$carpetaRespaldo" 2>/dev/null # BLOQUEO MENSAJE DE RECURSIVIDAD
	fi
	if [ "$LOG" -eq 1 ]; then
		logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
		echo "CARPETA RESPALDADA CON EXITO" "[$logTimeStamp]" >> "$log_file"
	fi
	if [ "$VERBOSE" -eq 1 ]; then
		echo "CARPETA RESPALDA CON EXITO"
	fi
	tar -czvf "$destino""$carpetaRespaldo".tar.gz "$destino""$carpetaRespaldo"
	rm -r "$destino""$carpetaRespaldo"
	if [ "$LOG" -eq 1 ]; then
		logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
		echo "CARPETA COMPRIMIDA CON EXITO" "[$logTimeStamp]" >> "$log_file"
	fi
	if [ "$VERBOSE" -eq 1 ]; then
		echo "CARPETA RESPALDADA CON EXITO"
	fi
}

# ######################[A U X I L I A R E S]########################

# BUSCAR Y VERIFICAR CARPETAS
verificar_origen(){
	if [ -d "$1" ]; then
		origen="$1"
	elif [ -d "$2" ]; then
		origen="$2"
	else
		if [ "$LOG" -eq 1 ]; then
			logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
			echo "| ERROR | FALTA CARPETA ORIGEN" "[$logTimeStamp]" >> "$log_file"
		fi
		echo "| ERROR | FALTA CARPETA ORIGEN"
		exit
	fi

	if [ $VERBOSE -eq 1 ]; then
		if [ "$LOG" -eq 1 ]; then
			logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
			echo "COMPOBADA LA EXISTENCIA DE LA CARPETA ORIGEN" "[$logTimeStamp]" >> "$log_file"
		fi
		echo "COMPOBADA LA EXISTENCIA DE LA CARPETA ORIGEN"
	fi

}
# ###################################################################

verificar_destino(){
	if [ -d "$1" ]; then
		destino="$1"
	elif [ -d "$2" ]; then
		destino="$2"
	elif [ -d "$3" ]; then
		destino="$3"
	elif [ -d "$4" ]; then
		destino="$4"
	elif [ -d "$5" ]; then
		destino="$5"
	elif [ -d "$6" ]; then
		destino="$6"
	else
		if [ "$LOG" -eq 1 ]; then
			logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
        	echo "CARPETA DESTINO NO EXISTE" "[$logTimeStamp]" >> "$log_file"
		fi
        echo "CARPETA DESTINO NO EXISTE"
		exit
	fi

	if [ $VERBOSE -eq 1 ]; then
		if [ "$LOG" -eq 1 ]; then
			logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
        	echo "COMPOBADA LA EXISTENCIA DE LA CARPETA DESTINO" "[$logTimeStamp]" >> "$log_file"
		fi
        echo "COMPOBADA LA EXISTENCIA DE LA CARPETA DESTINO"
    fi
}

# ###################################################################
verificar_igualdad(){
	
	if [ "$origen" == "$destino" ]; then
		if [ "$LOG" -eq 1 ]; then
			logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
			echo "| ERROR | NO SE PUEDE RESPALDAR EN LA CARPETA ORIGEN" "[$logTimeStamp]" >> "$log_file"
		fi
		echo "| ERROR | NO SE PUEDE RESPALDAR EN LA CARPETA ORIGEN"
		exit
	fi
}

# ###################################################################
# ###################################################################
# ###################################################################

# ###################################################################
# ########################[O P C I O N E S]##########################
# ###################################################################

# INCLUIR SUBCARPETAS
if [ "$3" == "-sc" ] || [ "$4" == "-sc"  ] || [ "$5" == "-sc" ]; then
	SUBCARPETA=1
fi

# GENERAR LOG
if [ "$3" == "-l" ] || [ "$4" == "-l"  ] || [ "$5" == "-l" ]; then
    LOG=1
fi

# VERBOSE MODE
if [ "$3" == "-v" ] || [ "$4" == "-v"  ] || [ "$5" == "-v" ] || [ "$3" == "--verbose" ] || [ "$4" == "--verbose"  ] || [ "$5" == "--verbose" ]; then
    VERBOSE=1
fi

# ###################################################################
# ###################################################################
# ###################################################################

# ###################################################################
# #############################[M A I N]#############################
# ###################################################################

# ########################[I N T E R F A Z]##########################

if [ "$1" == "--menu" ] || [ "$1" == "-M" ]; then
	CLI=0
	MENU=1
elif [ "$1" == "--config" ] || [ "$1" == "-C" ]; then
	CLI=0
	CONFIG=1
elif [ "$1" == "--editconfig" ] || [ "$1" == "-EC" ]; then
	CLI=0
	EDITCONFIG=1
fi

if [ $LOG -eq 1 ]; then
	logTimeStamp=$(date +"%m-%d-%y|%H-%M-%S")
	log_file=~/logs/log-"$logTimeStamp".log
	touch "$log_file"
fi

if [ $CLI -eq 1 ]; then
	verificar_origen "$1" "$2"
	verificar_destino  "$2" "$3" "$4" "$5" "$6"
	generar_respaldo
elif [ $MENU -eq 1 ]; then
	echo "#=========================================================#"
	echo "Ingrese 1 para activar modo Verbose, ingrese 0 para no activarlo: "
	read VERBOSE
	echo "Ingrese 1 para incluir subcarpetas, ingrese 0 para no incluirlas: "
	read SUBCARPETA
	echo "Ingrese 1 para activar generar log, ingrese 0 para no generarlo: "
	read LOG
	echo "INGRESE LA RUTA DE ORIGEN: "
	read origen
	echo "INGRESE LA RUTA DE DESTINO: "
	read destino

	verificar_origen "$origen"
	verificar_destino "$destino"
	generar_respaldo

	echo "#=========================================================#"

elif [ $CONFIG -eq 1 ]; then
	source ~/.config/respaldoScript/config.conf
	generar_respaldo
elif [ $EDITCONFIG -eq 1 ]; then
	nano ~/.config/respaldoScript/config.conf
fi

# ###################################################################
# ###################################################################
# ###################################################################
