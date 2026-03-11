# Linux Lab: Identity, Access & Cybersecurity 🛡️
> Hardening de sistemas RHEL-based, gestão de identidades (IAM) e defesa em profundidade.

| Categoria | Tecnologias | Status |
| :--- | :--- | :--- |
| **Segurança** | SELinux (Permissive), Tripwire | ✅ Stable |
| **Firewall** | Firewalld (Rich Rules), Fail2Ban | ✅ Ativo |
| **Criptografia** | LUKS (Data-at-Rest) | ✅ Implementado |
| **Auditoria** | Lynis (Hardening Index: 68) | ✅ Auditado |

---

## 🎯 Objetivo Técnico
Transformar um servidor padrão em uma infraestrutura resiliente e auditável, aplicando camadas de defesa em profundidade para proteção de dados e controle de acesso granular.

---

## 🛠️ Troubleshooting & Engenharia de Segurança

### 1. Gestão de Identidade e Acesso (IAM)
Implementação de controle granular via Cockpit, auditoria de sessões e configuração de permissões avançadas (ACLs).
![IAM Cockpit](docs/assets/iam-cockpit.png)
![ACL Configuration](docs/assets/01-acl-configuration-getfacl.png)
![User Session Audit](docs/assets/user-session-audit-ac.png)

### 2. Integridade e Detecção de Intrusão (FIM & Antivírus)
Uso do **Tripwire** para monitoramento de arquivos críticos e deploy do **ClamAV** para proteção contra malwares.
* **Resultado:** Auditoria completa via Lynis com Hardening Index 69.
![Lynis Index](docs/assets/index69_auditoria_hardening_lynis.png)
![Tripwire Integrity](docs/assets/tripwire-integrity-check-complete.png)
![ClamAV Deployment](docs/assets/clamav-antivirus-deployment.png)

### 3. Defesa de Perímetro (Firewall & SSH)
Blindagem de SSH na porta 2222 e bloqueio de força bruta com **Fail2Ban**.
![Auditoria Final](docs/assets/auditoria-final-hardening.png)
![Fail2Ban Status](docs/assets/fail2ban-ssh-jail-active-status.png)

### 3.1. Defesa de Perímetro e Análise de Ofensiva (SOC Mindset)
Blindagem de SSH na porta 2222 e monitoramento ativo de tentativas de intrusão.

* **Hardening de Firewall:** Configuração de `firewalld` com Rich Rules para auditoria de tráfego e segmentação de portas.
* **Detecção de Brute Force:** Identificação em tempo real de tentativas de acesso via usuários inválidos e IPs externos.

![Hardening Firewall](docs/assets/hardening-firewall-config.png)
![Detecção de Intrusão](docs/assets/poc-bruteforce-detection-journalctl.png)

> **Nota Técnica:** O log acima demonstra a captura de um evento de força bruta (MITRE T1110) originado de uma rede externa, onde o sistema identificou o IP atacante e o usuário alvo, permitindo a correlação de dados para resposta a incidentes.

### 4. Resolução de Conflitos de Kernel (NVIDIA/CUDA)
* **Incidente:** Mismatch entre bibliotecas NVML e módulos de Kernel.
* **Solução:** Saneamento de repositórios e deploy do Driver 580 (Open Kernel).
![Troubleshooting Kernel](docs/assets/troubleshooting-nvidia-mismatch-and-repo-cleanup.png)
![Setup Final](docs/assets/final-setup-rtx4050-driver-580-cuda-13.png)

---

## Automação de Auditoria e Saúde (Toolkit)
Desenvolvimento de scripts para garantir a conformidade contínua do ambiente:

* **`security_audit.sh`**: Validação de SELinux, SSH e Firewalld.
* **`check_system_health.sh`**: Diagnóstico proativo de recursos.
* **`monitor_sistema.sh`**: Monitoramento de logs e processos.

**Evidência de Monitoramento:**
![System Monitor Execution](docs/assets/monitor_sistema_sh.png)

---

## 🛡️ Diferenciais de Operação (SRE Mindset)

* **Compilação Manual (Nmap 7.98):** Domínio do ciclo de vida de software, compilando binários direto da fonte para auditoria.
![Nmap Success](docs/assets/nmap-compilation-success.png)
* **Hardening de Serviços:** Implementação de Masking em serviços desnecessários e tunelamento seguro.
![Hardening Service](docs/assets/hardening-service-masking-iptables.png)
* **SELinux Proativo:** Gestão de contextos sem desativar a proteção do Kernel.
![SELinux Resolution](docs/assets/ssh-hardening-selinux-resolution.png)

---

## 📂 Estrutura do Projeto
* `scripts/`: Toolkit de auditoria e monitoramento.
* `docs/assets/`: Evidências de hardening e relatórios de auditoria.

---
## ⏭️ Próxima Etapa
A segurança aqui estabelecida garante a integridade para as métricas e logs coletados no **[Repo 3: System Health & Observability](https://github.com/gabrielsystems-sec/system-observability-hub)**.
