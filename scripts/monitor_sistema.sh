#!/bin/bash

# 1. Importando a biblioteca (AULA 206)
source ./gabriel_devops.lib

echo "--- INICIANDO MONITORAMENTO DE INFRAESTRUTURA ---"

# 2. Validando segurança antes de prosseguir
check_root || exit 1

# 3. Coletando dados usando as funções modulares
CPU=$(get_cpu_load)
TIME=$(get_timestamp)

echo "[$TIME] Métrica coletada: CPU em $CPU%"

# Chama a nova função da biblioteca para decidir o que dizer
analisar_metricas $CPU

echo -e "\n--- [AULA 217] BUSCANDO FALHAS CRÍTICAS NO SISTEMA ---"
# Filtra apenas os erros de nível crítico (prio 3) do log do Kernel
journalctl -p 3 -n 5 --no-pager

echo -e "\n--- VERIFICANDO SERVIÇOS COM FALHA (SYSTEMD) ---"
systemctl list-units --state=failed --no-legend

# --- [AULA 218] GESTÃO DE FIREWALL MODERNO ---
echo -e "\n--- MONITORANDO PORTA SSH (2222) ---"
if ! sudo firewall-cmd --list-ports | grep -q "2222/tcp"; then
    echo -e "\e[31m[ALERTA] Porta 2222 fechada! Aplicando correção...\e[0m"
    sudo firewall-cmd --permanent --add-port=2222/tcp && sudo firewall-cmd --reload
    echo -e "\e[32m[REPARADO] Acesso SSH 2222 restaurado.\e[0m"
else
    echo -e "\e[32m[OK] Firewall permitindo tráfego na porta 2222.\e[0m"
fi
