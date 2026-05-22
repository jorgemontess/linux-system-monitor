#!/bin/bash

# Creando y guardando el log del monitoreo en un archivo con fecha
LOG_FILE="logs/system_$(date +%Y-%m-%d).log"

mkdir -p logs

exec > >(tee -a "$LOG_FILE") 2>&1

show_header(){
echo "==================================="
echo " Linux System Monitor"
echo "==================================="
echo "Fecha y Hora"
}

# Mostrar la fecha y hora actual
show_date(){
date +"%Y-%m-%d %H:%M:%S"
echo
}

# Mostrar uso de Disco
disk_usage(){
echo "Uso de disco"
df -h | head -n 6
echo
}

# Uso de CPU
cpu_usage(){
echo "Uso de CPU"
top -b -n 1 | grep "Cpu(s)"
echo
}


# Mostrar Memoria
memory_usage(){
echo "Uso de memoria"
free -h
echo
}

# Procesos de mayor consumo
top_memory_processes(){
echo "Procesos de memoria de Mayor consumo"
ps aux --sort=-%mem | head -n 6
echo
}

# Mostrar mayor consumo de CPU
top_cpu_processes(){
echo "Consumo de CPU"
ps aux --sort=-%cpu | head -n 6
echo
}

# Ejecutar las funciones
show_header
show_date
disk_usage
cpu_usage
memory_usage
top_memory_processes
top_cpu_processes

echo "Monitoreo finalizado"
echo
echo


