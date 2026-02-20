#!/bin/bash

README_FILE="README.md"

cat <<'INNER_EOF' > $README_FILE
# Repo 2: Identity, Access & Cybersecurity 🛡️

Este repositório documenta a implementação de controles de segurança e hardening. O foco é a **Defesa em Profundidade**, garantindo conformidade técnica desde o Kernel até a camada de rede.

---

## 🛠️ Laboratórios de Especialização

### **1. Identity & Access Management (IAM)**
Controle de privilégios e auditoria de usuários.

![ACL Management](docs/assets/01-acl-configuration-getfacl.png)
*Legenda: Implementação de permissões granulares via POSIX ACLs.*

* **Evidências Adicionais:**
    * [Auditoria de Usuários via CLI](docs/assets/user-audit-cli.png)
    * [Gestão Enterprise via Cockpit](docs/assets/iam-cockpit.png)
    * [Validação de Acesso ACL](docs/assets/02-acl-validation-user-access.png)

### **2. Proteção de Dados (LUKS Encryption)**
Criptografia de volumes para segurança de dados em repouso.

![LUKS Setup](docs/assets/luks-setup-complete.png)
*Legenda: Volume criptografado montado e pronto para operação segura.*

* **Evidências Adicionais:**
    * [Sucesso na Formatação LUKS](docs/assets/cryptsetup-format-success.png) 
    * [Troubleshooting: Device Busy Fix](docs/assets/luks-troubleshooting-umount.png) 

### **3. Hardening de Infraestrutura & Rede**
Blindagem do sistema e redução da superfície de ataque.

![Firewall Configuration](docs/assets/firewall-after-hardening.png)
*Legenda: Firewall configurado com política restritiva pós-auditoria.*

* **Evidências Adicionais:**
    * [Auditoria Nmap](docs/assets/nmap-audit.png) 
    * [SSH Hardening Config](docs/assets/sshd-config-hardening-final.png) 
    * [Service Masking & Target Tuning](docs/assets/hardening-service-masking-iptables.png) | [Target Config](docs/assets/hardening-target-configuration.png)

### **4. Segurança de Kernel (SELinux)**
Gestão de Mandatory Access Control (MAC).

![SELinux Status](docs/assets/selinux-full-activation-check.png)
*Legenda: Sistema operando em modo Enforcing com ativação total.*

* **Evidências Adicionais:**
    * [Relabeling Trigger](docs/assets/selinux-relabel-trigger.png) 
    * [Resolução de Conflitos SELinux](docs/assets/ssh-hardening-selinux-resolution.png) 

---

## 🏆 Workflow & Metodologia
Acompanhe o processo de desenvolvimento e documentação:
* [Estrutura do Projeto](docs/assets/projeto-estrutura-git.png) | [Vim Workflow](docs/assets/documentation-workflow-vim.png) | [Deploy Local](docs/assets/evidencia-deploy-local.png)

INNER_EOF

chmod +x update_readme.sh
echo "README.md atualizado com curadoria de imagens e links! 🚀"
