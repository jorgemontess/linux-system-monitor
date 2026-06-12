#!/bin/bash

# Creando y guardando el log del monitoreo en un archivo con fecha
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

LOG_DIR="$PROJECT_ROOT/logs"
LOG_FILE="$LOG_DIR/system_$(date +%Y-%m-%d).log"

mkdir -p "$LOG_DIR"

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
cpu_info=$(top -b -n 1 | grep "Cpu(s)")
echo "$cpu_info"

cpu_idle=$(echo "$cpu_info" | awk '{print $8}')

cpu_usage=$(echo "100 - $cpu_idle" | bc)

if (( $(echo "$cpu_usage > 80" | bc -l) )); then
    echo "Alerta: Uso de CPU alto: $cpu_usage%"
else
    echo "Uso de CPU: $cpu_usage%"
fi

echo
}


# Mostrar Memoria
memory_usage(){
echo "Uso de memoria"
memory_info=$(free -h)
echo "$memory_info"

total_memory=$(free -m | grep Mem | awk '{print $2}')
used_memory=$(free -m | grep Mem | awk '{print $3}')

memory_percent=$(echo "$used_memory / $total_memory * 100" | bc -l)
memory_usage=$(printf "%.2f" "$memory_percent")

if (( $(echo "$memory_usage > 70" | bc -l) )); then
    echo "Alerta: Uso de memoria alto: $memory_usage%"
else
    echo "Uso de memoria: $memory_usage%"
fi

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

# Buscar logs
cleanup_old_logs(){
    echo "Limpiando logs antiguos..."
    echo "Logs Eliminados:"
    find logs/ -name "*.log" -mtime +2
    find logs/ -name "*.log" -mtime +2 -delete
    echo
}

upload_s3(){
    echo "Subiendo archivo s3..."

    aws s3 cp "$LOG_FILE" s3://jorge-linux-monitor-logs

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
cleanup_old_logs
#upload_s3

echo "Monitoreo finalizado"
printf "\n\n"
