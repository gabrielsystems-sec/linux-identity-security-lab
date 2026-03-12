#!/bin/bash
# ---------------------------------------------------------
# Script: ssh_auto_hardening.sh
# Finalidade: Auditoria e Correção de Segurança do SSH
# ---------------------------------------------------------

SSH_CONF="/etc/ssh/sshd_config"

echo "--- [Iniciando Hardening de SSH] ---"

# 1. Criar backup da config original
sudo cp $SSH_CONF "$SSH_CONF.bak"

# 2. Desabilitar login de Root (Segurança Crítica)
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' $SSH_CONF
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' $SSH_CONF

# 3. Desabilitar senhas vazias
sudo sed -i 's/^#PermitEmptyPasswords.*/PermitEmptyPasswords no/' $SSH_CONF

# 4. Limitar tentativas de login
sudo sed -i 's/^#MaxAuthTries.*/MaxAuthTries 3/' $SSH_CONF

# 5. Reiniciar serviço para aplicar
sudo systemctl restart sshd

echo "[SUCESSO] Hardening aplicado e SSH reiniciado."
echo "[INFO] Backup salvo em $SSH_CONF.bak"
