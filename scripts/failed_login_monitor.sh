#!/bin/bash
# ---------------------------------------------------------
# Script: failed_login_monitor.sh
# Finalidade: Monitoramento em tempo real de tentativas de invasão
# ---------------------------------------------------------

LOG_FILE="/var/log/secure" # RockyLinux (no Ubuntu use /var/log/auth.log)
THRESHOLD=5

echo "[$(date)] --- Monitorando Brute Force ---"

# Extrai IPs com mais de 5 falhas de login
FAILED_IPS=$(sudo tail -n 100 $LOG_FILE | grep "Failed password" | awk '{print $(NF-3)}' | sort | uniq -c | awk -v t=$THRESHOLD '$1 > t {print $2}')

if [ -z "$FAILED_IPS" ]; then
    echo "[OK] Nenhuma atividade suspeita detectada."
else
    for IP in $FAILED_IPS; do
        echo "[ALERTA CRÍTICO] IP $IP detectado com múltiplas falhas de login!"
        # No Repo 5, poderíamos integrar aqui um comando de bloqueio (iptables)
    done
fi
