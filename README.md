# Linux System Monitor (Sistema de monitoreo de sistema Linux)

Proyecto práctico de DevOps para monitorear recursos básicos de un sistema Linux utilizando Bash.

## Objetivo

Crear un script que nos pueda mostrar información básica del sistema, como fecha y hora, uso de CPU, uso de memoria, espacio en disco, y procesos con mayor consumo.

## Tecnologías Utilizadas

- Linux (Ubuntu)
- Bash (Lenguaje de scripting)
- NeoVim (Editor de texto)
- Git (Control de versiones)
- GitHub (Repositorio remoto)

## Caracteristicas

- Monitoreo de uso de CPU
- Monitoreo de memoria RAM
- Monitoreo de espacio en disco
- Procesos con mayor consumo
- Generación automática de logs
- Limpieza automatica de logs antiguos

## Estructura del proyecto

```text
linux-system-monitor/
├── README.md
├── logs/
│   └── system_date.log
└── scripts/
    └── system_monitor.sh
```

## Cómo ejecutar el script

1. Clona el repositorio en tu sistema Linux:

```bash
git clone https://github.com/jorgemontess/linux-system-monitor.git
```

2. Navega al directorio del proyecto:

```bash
cd linux-system-monitor
```

3. Da permisos de ejecución al script:

```bash
chmod +x scripts/system_monitor.sh
```

4. Ejecuta el script:

```bash
./scripts/system_monitor.sh
```

## Vista

![System Monitor](images/preview.png)
