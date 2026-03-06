#!/bin/bash
echo "--- SSH HARDENING AUDIT ---"
echo "Data: $(date)"
echo "---------------------------"
grep -E "PermitRootLogin|PasswordAuthentication|Port|MaxAuthTries" /etc/ssh/sshd_config
echo "---------------------------"
