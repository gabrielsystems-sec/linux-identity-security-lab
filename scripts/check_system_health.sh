#!/bin/bash

# --- VALIDAÇÃO DE USUÁRIO (Hardening) ---
# Garante que operações sensíveis de monitoramento sejam feitas por quem tem poder.
if [ "$EUID" -ne 0 ]; then
    echo "❌ [ERRO] Este script de auditoria exige privilégios de ROOT."
    exit 1
fi

# --- VALIDAÇÃO DE ARGUMENTOS (Robustez Aula 200) ---
# O script espera o nome de um log ou serviço para validar.
if [ $# -ne 1 ]; then
    echo "⚠️  Uso: $0 <termo_para_busca_em_logs>"
    echo "Exemplo: $0 'critical'"
    exit 1
fi

BUSCA=$1
LOG_REF="relatorio_final.txt" # Arquivo que já existe no seu ls

echo "🚀 Iniciando Validação de Saúde do Sistema em: $(date)"

# --- VALIDAÇÃO DE EXISTÊNCIA (Evitando Falsos Positivos) ---
if [ ! -f "$LOG_REF" ]; then
    echo "🛑 [CRITICAL] Arquivo de referência $LOG_REF não encontrado no diretório atual!"
    exit 1
fi

# --- AUTOMAÇÃO DE BUSCA E STATUS ---
echo "🔍 Analisando ocorrências de '$BUSCA' no log de sistema..."
sleep 1

OCORRENCIAS=$(grep -c "$BUSCA" "$LOG_REF")

if [ "$OCORRENCIAS" -gt 0 ]; then
    echo "🚨 ATENÇÃO: Encontradas $OCORRENCIAS instâncias de '$BUSCA' no log."
    exit 0
else
    echo "✅ Sistema estável. Nenhuma ocorrência de '$BUSCA' encontrada."
    exit 0
fi
