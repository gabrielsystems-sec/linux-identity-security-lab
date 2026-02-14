# Repo 2: Identity, Access & Cybersecurity

Este repositório foca na implementação de segurança operacional, gestão de identidades e **Hardening** de sistemas Linux, focado em infraestruturas críticas e conformidade técnica.

> **Status:** 🚧 Em construção. Conteúdo atualizado conforme a evolução dos laboratórios.

---

## Objetivos de Engenharia
* **Identity Management:** Gestão de ciclo de vida de usuários e controle de acessos (IAM).
* **Access Control:** Implementação de permissões avançadas e segurança de arquivos.
* **System Hardening:** Aplicação de políticas para redução da superfície de ataque.
* **Security Automation:** Desenvolvimento de ferramentas para auditoria e automação de segurança.

---

## Laboratórios e Casos de Uso

### **Lab 01: Gestão de Usuários e Password Compliance**
**Objetivo:** Provisionamento de contas, auditoria de políticas de segurança e controle de privilégios.

![IAM Audit](docs/assets/user-audit-cli.png)
*Legenda: Auditoria de conformidade de usuários e permissões via CLI.*

**Resumo Técnico:**
- **Acesso Restrito:** Implementação de privilégios elevados via grupo `wheel` (Sudoers).
- **Compliance:** Verificação de validade e complexidade de senhas com o comando `chage`.
- **Privacy:** Ajuste de permissões em diretórios sensíveis (Restrição de `/home` para `700`).

### **Lab 02: Network Security & Intelligence (Auditoria de Redes)**
**Objetivo:** Mapeamento de superfície de ataque e análise de protocolos críticos sob a ótica de segurança.

![Network & Service Audit](docs/assets/nmap-audit.png)
*Legenda: Auditoria de serviços e protocolos (Layer 4/7) via binário customizado do Nmap.*

**Resumo Técnico:**
- **Análise de Camadas:** Monitoramento de handshakes TCP/UDP e mapeamento de portas abertas.
- **Protocol Hardening:** Identificação e recomendação de desativação de protocolos legados (Telnet, FTP, HTTP).
- **Ferramenta Customizada:** `Nmap v7.98` compilado manualmente em **Rocky Linux** com suporte a **OpenSSL 3.5.1** e **LibSSH2 1.11.1**.

#### Protocol Analysis Focus
- **SSH (22):** Auditoria de algoritmos de troca de chaves (KexAlgorithms).
- **DNS (53):** Verificação de integridade de zonas e prevenção de *DNS Poisoning*.
- **HTTP/S (80/443):** Análise de certificados SSL/TLS e headers de segurança.

---
## Scripts e Automação
* [**init_repo2.sh**](./init_repo2.sh): Automação de workspace e padronização de logs de auditoria.

## Metodologia e Evidências de Processo
Documentação aplicada para garantir padrões de nível **Enterprise**.

* **[Estrutura de Diretórios](docs/assets/projeto-estrutura-git.png)**: Organização profissional e escalável.
* **[Ciclo de Vida Git](docs/assets/evidencia-deploy-local.png)**: Gerenciamento de versão rigoroso via CLI.
* **[Workflow de Documentação](docs/assets/documentation-workflow-vim.png)**: Elaboração técnica via **Vim**.
