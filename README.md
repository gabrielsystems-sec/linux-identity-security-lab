# Repo 2: Identity, Access & Cybersecurity 🛡️

Este repositório é dedicado ao estudo e implementação de segurança operacional, gestão de identidades e endurecimento (hardening) de sistemas Linux.

> **Status:** 🚧 Em construção. O conteúdo é construído conforme a evolução dos laboratórios práticos.

## Objetivos de Engenharia
* **Identity Management:** Gestão de ciclo de vida de usuários e controle de acessos.
* **Access Control:** Implementação de permissões avançadas e segurança de arquivos.
* **System Hardening:** Aplicação de políticas para redução da superfície de ataque.
* **Security Automation:** Desenvolvimento de ferramentas para auditoria e automação de segurança.

---

## Laboratórios e Casos de Uso
#### **Lab 01: User Management & Password Compliance**
**Objective:** Provisioning users and auditing account security policies.
* **IAM Dashboard (Cockpit):** [View Evidence](docs/assets/iam-cockpit.png)
* **Security Audit (CLI):** [View Evidence](docs/assets/user-audit-cli.png)

**Technical Summary:**
- Hardened user access via `wheel` group.
- Verified password aging compliance with `chage`.
- Restricted `/home` permissions to `700`.

---

## Scripts e Automação
Repositório de ferramentas desenvolvidas para otimização de segurança e infraestrutura:

* [**init_repo2.sh**](./init_repo2.sh): Automação para organização do workspace de segurança.

---

## 🛠️ Technical Process & Workflow Evidence

Além dos resultados finais, este repositório documenta a metodologia aplicada para garantir padrões de nível enterprise.

### 🔍 Project Audit
* **[Directory Hierarchy](docs/assets/projeto-estrutura-git.png)**: Visualização da organização profissional de pastas e separação de interesses.
* **[Git Staging & Lifecycle](docs/assets/evidencia-deploy-local.png)**: Evidência do gerenciamento de versão via CLI, demonstrando controle sobre o ciclo de vida do código.
* **[Documentation Methodology](docs/assets/documentation-workflow-vim.png)**: Registro da elaboração técnica utilizando **Vim**, focando em produtividade e operação em ambientes headless.

> **Global Mindset**: As evidências acima comprovam a capacidade de operar seguindo padrões internacionais de engenharia e documentação.

---

## 🌎 Global Outreach / Alcance Global

Este repositório segue padrões de documentação de empresas multinacionais. Para garantir a fidelidade técnica, **termos de engenharia, logs de sistema e mensagens de erro** são mantidos exclusivamente em Inglês.

This repository follows multinational documentation standards. To ensure technical accuracy, **engineering terms, system logs, and error messages** are maintained exclusively in English.
