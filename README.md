# Identity, Access & Cybersecurity 🛡️

> Hardening de sistemas RHEL-based, gestão de identidades (IAM) e defesa em profundidade.

| Categoria | Tecnologias | Status |
| :--- | :--- | :--- |
| **Segurança** | SELinux (Permissive), Tripwire | ✅ Stable |
| **Firewall** | Firewalld (Rich Rules), Fail2Ban | ✅ Ativo |
| **Criptografia** | LUKS (Data-at-Rest) | ✅ Implementado |
| **Auditoria** | Lynis (Hardening Index: 69) | ✅ Auditado |

---

## 🎯 Objetivo Técnico
Transformar um servidor padrão em uma infraestrutura resiliente e auditável, aplicando camadas de defesa em profundidade para proteção de dados e controle de acesso granular no Rocky Linux.

---

## 📁 1. Gestão de Identidade e Acesso (IAM)

### Contexto do Problema
Necessidade de centralizar a gestão de acessos administrativos, auditar sessões e aplicar permissões granulares no sistema de arquivos além do padrão RWX tradicional.

### Troubleshooting e Resolução
* **Solução Aplicada:** Implementação de controle de acesso via Cockpit unificado. Configuração de ACLs avançadas via `setfacl` e auditoria de sessões ativas via binários de accounting do sistema.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver o painel de IAM, ACLs e Auditoria de Sessão</summary>

  * **IAM Cockpit:** ![IAM Cockpit](docs/assets/iam-cockpit.png)
  * **Configuração de ACL:** ![ACL Configuration](docs/assets/01-acl-configuration-getfacl.png)
  * **Auditoria de Sessão:** ![User Session Audit](docs/assets/user-session-audit-ac.png)
  * **RBAC Final (MongoDB/System):** ![RBAC Implementation](docs/assets/evidencia-rbac-final.png)
  * **Password Policy (PAM/Shadow):** ![Password Policy](docs/assets/politica_senhas_e_seguranca_acesso.png)
</details>

---

## 📁 2. Integridade e Detecção de Intrusão (FIM & Antivírus)

### Contexto do Problema
Garantir que binários do sistema operacional e arquivos de configuração críticos não sejam alterados por atores maliciosos (ataques de persistência).

### Troubleshooting e Resolução
* **Solução Aplicada:** Deploy do **Tripwire** para File Integrity Monitoring (FIM) e do **ClamAV** para varredura de malwares em tempo real. Submissão do host ao benchmark do Lynis atingindo o índice de Hardening 69.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver os relatórios do Lynis, Tripwire e ClamAV</summary>

  * **Lynis Hardening Index 69:** ![Lynis Index](docs/assets/index69_auditoria_hardening_lynis.png)
  * **Tripwire Integrity Check:** ![Tripwire Integrity](docs/assets/tripwire-integrity-check-complete.png)
  * **ClamAV Status:** ![ClamAV Deployment](docs/assets/clamav-antivirus-deployment.png)
</details>

---

## 📁 3. Defesa de Perímetro e Análise de Ofensiva (SOC Mindset)

### Contexto do Problema
O serviço de SSH na porta padrão (22) sofria constantes tentativas automatizadas de brute force.

### Troubleshooting e Resolução
1. **Blindagem:** Migração do SSH para a porta não convencional `2222` e amarração do daemon `fail2ban` para banimento automático de IPs ofensores.
2. **SOC Mindset:** Monitoramento de logs via `journalctl` correlacionando eventos com a matriz MITRE ATT&CK (T1110 - Brute Force). Bloqueio de tráfego de borda via Rich Rules do Firewalld.
3. **Políticas de Transição:** Configuração de diretrizes para o SELinux e análise de logs de auditoria (avc: denied) para garantir que a transição para o modo Enforcing ocorra sem interrupção de serviços críticos.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver o Firewall, Fail2Ban e Detecção de Brute Force</summary>

  * **Auditoria de Hardening SSH:** ![Auditoria Final](docs/assets/auditoria-final-hardening.png)
  * **Jail do Fail2Ban Ativa:** ![Fail2Ban Status](docs/assets/fail2ban-ssh-jail-active-status.png)
  * **Firewalld Rich Rules:** ![Hardening Firewall](docs/assets/hardening-firewall-config.png)
  * **Captura de Brute Force (SOC):** ![Detecção de Intrusão](docs/assets/poc-bruteforce-detection-journalctl.png)
  * **Network Whitelisting:** ![Firewall Whitelist](docs/assets/firewall_whitelist_native_network.png)
  * **Native Firewall Rules:** ![Firewall Config](docs/assets/02_firewall_config.png)
  * **SELinux Enforcement Policy:** ![SELinux Config](docs/assets/03_selinux_configuration.png)
</details>

---

## 📁 4. Resolução de Conflitos de Kernel (NVIDIA/CUDA)

### Contexto do Problema
Mismatch crítico entre bibliotecas de usuário NVML e os módulos do Kernel Linux carregados em tempo de execução para aceleração gráfica.

### Troubleshooting e Resolução
* **Causa Raiz:** Múltiplos repositórios conflitantes habilitados simultaneamente instalando versões dessincronizadas do driver proprietário.
* **Solução Aplicada:** Purge completo das bibliotecas antigas, saneamento da lista de repositórios do DNF e deploy limpo do Driver Open Kernel (v580) e Toolkit CUDA.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver a resolução de Kernel e o Setup CUDA</summary>

  * **Limpeza de Repos:** ![Troubleshooting Kernel](docs/assets/troubleshooting-nvidia-mismatch-and-repo-cleanup.png)
  * **Setup Final RTX/CUDA:** ![Setup Final](docs/assets/final-setup-rtx4050-driver-580-cuda-13.png)
</details>

---

## 🤖 Automação de Auditoria e Saúde (Toolkit)

Desenvolvimento de scripts Bash para garantir a conformidade contínua do ambiente:

* **`security_audit.sh`**: Validação automatizada de conformidade de SELinux, SSH e Firewalld.
* **`check_system_health.sh`**: Diagnóstico proativo de saúde de hardware e swap.
* **`monitor_sistema.sh`**: Centralizador de logs e comportamento de processos suspeitos.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver a execução do Script de Monitoramento</summary>

  ![System Monitor Execution](docs/assets/monitor_sistema_sh.png)
</details>

---

## 🛡️ Diferenciais de Operação (Engenharia de Segurança)

### Compilação Manual (Nmap de Terceiros)
Domínio total do ciclo de vida de software, compilando binários direto do código-fonte para evitar dependências comprometidas de repositórios externos.

### SELinux Sem Desvios
Gestão proativa de contextos de segurança, tratando alertas de violação via audit2allow e semanage, garantindo que o sistema esteja preparado para o modo Enforcing sem a necessidade de desativar as proteções do Kernel.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver a compilação do Nmap, Mascaramento e SELinux</summary>

  * **Nmap Compilation Success:** ![Nmap Success](docs/assets/nmap-compilation-success.png)
  * **Service Masking:** ![Hardening Service](docs/assets/hardening-service-masking-iptables.png)
  * **SELinux Context Resolution:** ![SELinux Resolution](docs/assets/ssh-hardening-selinux-resolution.png)
</details>

---

## ⏭️ Próxima Etapa
As políticas de segurança e rastreamento aqui estabelecidas garantem a integridade confiável para as métricas e logs coletados no **[Repo 3: System Health & Observability](https://github.com/gabrielsystems-sec/system-observability-hub)**.
