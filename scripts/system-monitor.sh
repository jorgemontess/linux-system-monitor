#!/bin/bash

echo "==================================="
echo " Linux System Monitor"
echo "==================================="
echo "Fecha y Hora"

# Mostrar la fecha y hora actual
date +"%Y-%m-%d %H:%M:%S"
echo

# Mostrar uso de Disco
echo "Uso de disco"
df -h
echo

# Uso de CPU
echo "Uso de CPU"
top -b -n 1 | grep "Cpu(s)"
echo


# Mostrar Memoria
echo "Uso de memoria"
free -h
echo

# Procesos de mayor consumo
echo "Procesos de Mayor consumo"
ps aux --sort=-%mem | head -n 6
echo

# Mostrar mayor consumo de CPU
echo "Consumo de CPU"
ps aux --sort=-%cpu | head -n 6
echo

echo "Monitoreo finalizado"


