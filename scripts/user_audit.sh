#!/bin/bash
# User Security Audit Script

echo "--- STARTING SECURITY AUDIT ---"
echo "Checking users with UID >= 1000 (Human Users):"

# Lista usuários e mostra o status da senha
awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | while read user; do
    echo "------------------------------"
    echo "User: $user"
    sudo chage -l "$user" | grep "Password expires"
done

echo "------------------------------"
echo "--- AUDIT COMPLETE ---"
