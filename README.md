# Identity & Cybersecurity 🛡️

> Hardening de sistemas RHEL-based, gestão de identidades e defesa em profundidade.

| Categoria | Tecnologias | Foco |
| :--- | :--- | :--- |
| **Identidade** | PAM / ACLs / Cockpit | Controle de acesso |
| **Integridade** | Tripwire / Lynis / ClamAV | FIM e auditoria |
| **Defesa** | Firewalld / Fail2Ban | Mitigação de ataques |
| **Proteção de Dados** | LUKS | Criptografia em repouso |
| **Sistema** | SELinux | Controle de segurança |

---

## Objetivo

Este laboratório documenta práticas de hardening e segurança em Rocky Linux, abordando controle de acesso, proteção de dados, monitoramento de integridade e defesa contra ataques.

O ambiente foi desenvolvido a partir de problemas práticos, investigações e processos de troubleshooting.

---

## 1. Gestão de Identidade e Acesso

### Contexto do Problema

Centralizar a gestão administrativa e aplicar o Princípio do Menor Privilégio para reduzir riscos de escalada de privilégios.

### Implementação

- Configuração do PAM para aplicar políticas de senha e bloqueio após tentativas inválidas.
- Implementação de permissões granulares com ACLs via `setfacl`.
- Auditoria de sessões e acesso administrativo.

<details>
  <summary>Ver IAM, ACLs e auditoria</summary>

**IAM Cockpit Dashboard**

![IAM Cockpit](./docs/assets/iam-cockpit.png)

**Configuração de ACLs**

![ACL Config](./docs/assets/01-acl-configuration-getfacl.png)

**Validação de acesso**

![ACL Validation](./docs/assets/02-acl-validation-user-access.png)

**Política de senhas**

![PAM Config](./docs/assets/rocky-linux-pam-system-auth.png)

**Auditoria de sessão**

![Session Audit](./docs/assets/user-session-audit-ac.png)

</details>

---

## 2. Integridade e Auditoria

### Contexto do Problema

Garantir que binários críticos, como `passwd` e `sshd`, não sejam substituídos ou modificados sem detecção.

### Implementação

- Criação de baseline de integridade com Tripwire.
- Auditoria do host com Lynis.
- Validação da proteção com ClamAV.

O laboratório atingiu um **Hardening Index 69** após a remediação de flags críticas identificadas.

<details>
  <summary>Ver integridade e auditoria</summary>

**Baseline do Tripwire**

![Tripwire Init](./docs/assets/tripwire-init-command.png)

**Check de integridade**

![Tripwire Report](./docs/assets/tripwire-integrity-check-complete.png)

**Hardening Index**

![Lynis Index](./docs/assets/index69_auditoria_hardening_lynis.png)

**ClamAV**

![ClamAV Status](./docs/assets/clamav-antivirus-deployment.png)

</details>

---

## 3. Brute Force e Defesa Ativa

### O Incidente

Identificação de ataques de dicionário automatizados contra o serviço SSH.

### Investigação e Mitigação

1. Identificação de padrões de ataque por meio do `journalctl`.
2. Detecção e bloqueio automático pelo Fail2Ban.
3. Aplicação de regras no Firewalld.
4. Hardening adicional do SSH com alteração da porta e whitelisting.

<details>
  <summary>Ver investigação e defesa</summary>

**Detecção de brute force**

![SOC Detection](./docs/assets/poc-bruteforce-detection-journalctl.png)

**Fail2Ban ativo**

![Fail2Ban Status](./docs/assets/fail2ban-ssh-jail-active-status.png)

**Regras de firewall**

![Firewall Rules](./docs/assets/firewall_whitelist_native_network.png)

**Hardening do SSH**

![SSH Final](./docs/assets/sshd-config-hardening-final.png)

</details>

---

## 4. Criptografia de Dados em Repouso

### Contexto do Problema

Proteger dados sensíveis contra montagem não autorizada e extração física dos discos.

### Implementação

Configuração de criptografia de bloco com **LUKS (dm-crypt)** para proteção dos dados em repouso.

<details>
  <summary>Ver configuração do LUKS</summary>

**Cryptsetup**

![LUKS Format](./docs/assets/cryptsetup-format-success.png)

**Configuração concluída**

![LUKS Final](./docs/assets/luks-setup-complete.png)

**Troubleshooting de desmontagem**

![LUKS Fix](./docs/assets/luks-troubleshooting-umount.png)

</details>

---

## 5. Resolução de Conflito NVIDIA/CUDA

### Contexto do Problema

Falha de `NVML Mismatch` após atualização de bibliotecas, impedindo o uso da aceleração por hardware.

### Causa e Resolução

A causa identificada foi a existência de múltiplos repositórios DNF instalando versões dessincronizadas do driver.

A resolução envolveu:

- Remoção dos drivers legados.
- Saneamento dos repositórios.
- Instalação limpa do NVIDIA Open Kernel Driver v580.
- Configuração do CUDA Toolkit 13.

<details>
  <summary>Ver resolução do conflito</summary>

**Limpeza e correção**

![Kernel Resolution](./docs/assets/troubleshooting-nvidia-mismatch-and-repo-cleanup.png)

**Configuração final**

![CUDA Success](./docs/assets/final-setup-rtx4050-driver-580-cuda-13.png)

</details>

---

## 6. Compilação e SELinux

### Compilação a partir do Código-Fonte

Compilação do Nmap diretamente do código-fonte para compreender o processo de instalação e validação do binário.

### SELinux

Gestão de contextos e resolução de violações utilizando `semanage`, mantendo o sistema em modo `Enforcing`.

<details>
  <summary>Ver compilação e SELinux</summary>

**Compilação do Nmap**

![Nmap Success](./docs/assets/nmap-compilation-success.png)

**Resolução de contexto**

![SELinux Resolution](./docs/assets/ssh-hardening-selinux-resolution.png)

**Verificação final**

![SELinux Status](./docs/assets/selinux-full-activation-check.png)

</details>

> **Nota sobre SELinux**
>
> Durante a ativação do SELinux, o processo de `relabeling` no boot é necessário para atualizar os contextos de segurança do sistema de arquivos.
>
> ![SELinux Relabel](./docs/assets/selinux-relabel-trigger.png)

---

## Automação de Auditoria

O script `monitor_sistema.sh` centraliza verificações de segurança do ambiente, incluindo regras de firewall e logs relacionados a tentativas de intrusão.

![Security Audit](./docs/assets/monitor_sistema_sh.png)
