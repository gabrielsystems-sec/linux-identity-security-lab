#!/bin/bash
echo "--- RELATÓRIO DE HARDENING CRÍTICO ---"
echo "1. STATUS SELINUX:"
getenforce
echo ""
echo "2. PORTA SSH ATIVA:"
ss -tulpn | grep ssh
echo ""
echo "3. VERIFICANDO FIREWALL (Rich Rules):"
firewall-cmd --list-rich-rules
echo ""
echo "4. INTEGRIDADE (TRIPWIRE STATUS):"
ls -l /var/lib/tripwire/*.twd && echo "Banco de dados OK" || echo "Atenção: DB ausente"
echo "---------------------------------------"
