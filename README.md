# Identity, Access & Cybersecurity 🛡️

Repositório dedicado ao **Hardening de sistemas RHEL-based**, gestão de identidades (IAM) e implementação de **Defesa em Profundidade**. Este laboratório documenta a transição de um servidor padrão para uma infraestrutura resiliente, auditável e protegida contra vetores de ataque modernos no Rocky Linux.

## 🎯 Business Value & Segurança
O objetivo central é garantir a **Integridade, Confidencialidade e Disponibilidade** dos ativos. Através de criptografia de repouso (LUKS), controle de acesso granular (ACLs) e monitoramento de integridade de arquivos (FIM), estabelecemos um ambiente em conformidade com as melhores práticas de governança e segurança defensiva.

---

## Stack Tecnológica & Matriz de Arquitetura
* **Segurança de Kernel:** SELinux (Enforcing/Targeted), PAM (Pluggable Authentication Modules).
* **Proteção de Dados:** LUKS (Linux Unified Key Setup) - AES-256.
* **Defesa de Perímetro:** Firewalld (Rich Rules), Fail2Ban (Jails customizadas).
* **Auditoria & FIM:** Tripwire (File Integrity Monitoring), Lynis, ClamAV.
* **Aceleração & Kernel:** NVIDIA Driver Open Kernel (v580) & CUDA Toolkit 13.

### Matriz de Defesa em Profundidade
| Camada | Tecnologia Principal | Estratégia de Defesa | Função no Ecossistema |
| :--- | :--- | :--- | :--- |
| **Data-at-Rest** | LUKS Cripto | AES-256 Encryption | Proteção física contra furto/extração de discos |
| **Identidade** | PAM / ACLs / Cockpit | MFA & Least Privilege | Controle rigoroso de acesso administrativo |
| **Integridade** | Tripwire | FIM (Baseline Hashing) | Detecção de alterações em binários do sistema |
| **Intrusão** | Fail2Ban | Brute Force Mitigation | Banimento automático de IPs ofensores |
| **Auditoria** | Lynis | Hardening Index Scoring | Verificação contínua de conformidade e riscos |

---

## 📁 1. Gestão de Identidade e Acesso (IAM & ACLs)

### Contexto do Problema
Centralizar a gestão administrativa e aplicar o Princípio do Menor Privilégio (PoLP) para mitigar riscos de escalada de privilégios.

### Resolução SRE
* **PAM Hardening:** Configuração do `system-auth` para forçar complexidade e travar contas após tentativas inválidas.
* **ACLs Avançadas:** Implementação de permissões granulares via `setfacl`, permitindo acesso pontual a usuários de serviço sem alterar as permissões globais do sistema.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver IAM, ACLs e Auditoria</summary>

  * **IAM Cockpit Dashboard:** ![IAM Cockpit](./docs/assets/iam-cockpit.png)
  * **Configuração de ACLs:** ![ACL Config](./docs/assets/01-acl-configuration-getfacl.png)
  * **Validação de Acesso ACL:** ![ACL Validation](./docs/assets/02-acl-validation-user-access.png)
  * **Política de Senhas (PAM):** ![PAM Config](./docs/assets/rocky-linux-pam-system-auth.png)
  * **Auditoria de Sessão:** ![Session Audit](./docs/assets/user-session-audit-ac.png)
</details>

---

## 📁 2. Integridade e Detecção (FIM & Compliance)

### Contexto do Problema
Garantir que binários críticos (como `passwd` ou `sshd`) não sejam substituídos por versões maliciosas (Backdoors).

### Resolução
* **Tripwire Deployment:** Criação da base de dados (Baseline) assinada com chaves criptográficas.
* **Auditoria Lynis:** Submissão do host ao benchmark de segurança, atingindo o **Hardening Index 69** após a remediação de flags críticas.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver Integridade e Auditoria</summary>

  * **Baseline do Tripwire:** ![Tripwire Init](./docs/assets/tripwire-init-command.png)
  * **Check de Integridade Final:** ![Tripwire Report](./docs/assets/tripwire-integrity-check-complete.png)
  * **Hardening Index 69:** ![Lynis Index](./docs/assets/index69_auditoria_hardening_lynis.png)
  * **Antivírus ClamAV:** ![ClamAV Status](./docs/assets/clamav-antivirus-deployment.png)
</details>

---

## 📁 3. [GOLDEN EVIDENCE] SOC Mindset: Brute Force & Defesa Ativa

### O Incidente (PoC de Ofensiva)
Identificação de ataques de dicionário automatizados no serviço SSH visando a quebra de credenciais administrativas.

### Troubleshooting & Mitigação
1. **Identificação:** Captura de padrões de ataque via `journalctl` (T1110 - MITRE ATT&CK).
2. **Jail Action:** O **Fail2Ban** detectou o padrão anômalo, inserindo o IP na `REJECT` chain do Firewalld.
3. **Hardening Final:** Migração do SSH para a porta **2222** e aplicação de Rich Rules para Whitelisting.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver a Defesa Ativa</summary>

  * **Captura de Brute Force:** ![SOC Detection](./docs/assets/poc-bruteforce-detection-journalctl.png)
  * **Fail2Ban Jail Active:** ![Fail2Ban Status](./docs/assets/fail2ban-ssh-jail-active-status.png)
  * **Firewall Whitelist:** ![Firewall Rules](./docs/assets/firewall_whitelist_native_network.png)
  * **Hardening SSH Config:** ![SSH Final](./docs/assets/sshd-config-hardening-final.png)
</details>

---

## 📁 4. Criptografia Data-at-Rest (LUKS)

### Contexto do Problema
Necessidade de proteger dados sensíveis contra montagem não autorizada e extração física de discos do servidor.

### Resolução
Implementação de criptografia de bloco via **LUKS (dm-crypt)**. O volume é descriptografado apenas em tempo de execução via passphrase segura, garantindo proteção total "at-rest".

### Evidência Técnica
<details>
  <summary>📂 Clique para ver o Setup de Criptografia</summary>

  * **Cryptsetup Format Success:** ![LUKS Format](./docs/assets/cryptsetup-format-success.png)
  * **LUKS Setup Complete:** ![LUKS Final](./docs/assets/luks-setup-complete.png)
  * **Troubleshooting umount:** ![LUKS Fix](./docs/assets/luks-troubleshooting-umount.png)
</details>

---

## 📁 5. Resolução de Conflitos de Kernel (NVIDIA/CUDA)

### Contexto do Problema
Falha crítica de "NVML Mismatch" impedindo o uso de aceleração via hardware após atualização de bibliotecas.

### Troubleshooting (Causa Raiz)
* **Causa Raiz:** Múltiplos repositórios DNF habilitados instalando versões dessincronizadas do driver proprietário.
* **Resolução:** Purge completo de drivers legados, saneamento de repositórios e instalação limpa do Driver Open Kernel (v580) e CUDA 13.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver a Resolução de Kernel</summary>

  * **Repo Cleanup & Fix:** ![Kernel Resolution](./docs/assets/troubleshooting-nvidia-mismatch-and-repo-cleanup.png)
  * **Setup Final CUDA:** ![CUDA Success](./docs/assets/final-setup-rtx4050-driver-580-cuda-13.png)
</details>

---

## 📁 6. Diferenciais de Engenharia: Compilação & SELinux

### Diferenciais Técnicos
* **Source Compilation:** Compilação do Nmap direto do código-fonte para garantir a integridade absoluta do binário.
* **SELinux Mastery:** Gestão proativa de contextos, resolvendo violações via `semanage` e mantendo o sistema em conformidade com o modo Enforcing.

### Evidência Técnica
<details>
  <summary>📂 Clique para ver Compilação e SELinux</summary>

  * **Nmap Compilation:** ![Nmap Success](./docs/assets/nmap-compilation-success.png)
  * **SELinux Context Fix:** ![SELinux Resolution](./docs/assets/ssh-hardening-selinux-resolution.png)
  * **Full Activation Check:** ![SELinux Status](./docs/assets/selinux-full-activation-check.png)
</details>

---

> [!IMPORTANT]
> **SRE Insight: SELinux Relabeling**
> Durante a ativação do SELinux, o processo de `relabeling` no boot é vital. Interromper essa fase pode corromper os contextos de segurança de todo o sistema de arquivos.
> ![SELinux Relabel](./docs/assets/selinux-relabel-trigger.png)

> [!TIP]
> **Automação de Auditoria**
> O script `monitor_sistema.sh` centraliza a saúde do hardening, auditando semanalmente as regras de firewall e logs de intrusão.
> ![Security Audit](./docs/assets/monitor_sistema_sh.png)
