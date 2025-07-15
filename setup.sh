#!/bin/bash
# === Configuración de log ===
LOGFILE="$HOME/setup_$(date +%F_%T).log"
exec > >(tee -i "$LOGFILE") 2>&1

# Actualizar paquetes e instalar software
apt-get update && apt-get install -y \
    python3 \
    make \
    emacs \
    wget \
    tar \
    software-properties-common \
    git \
    build-essential

apt-get clean
rm -rf /var/lib/apt/lists/*
useradd -m -d /share/pollo -s /bin/bash pollo || echo "Usuario ya existe"	
echo "==> Configuración finalizada correctamente"
