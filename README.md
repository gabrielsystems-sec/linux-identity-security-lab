# Repo 2: Identity, Access & Cybersecurity

Este repositório foca na implementação de segurança operacional, gestão de identidades e **Hardening** de sistemas Linux.

> **Status:** 🚧 Em construção. Conteúdo atualizado conforme a evolução dos laboratórios.

## Objetivos de Engenharia
* **Identity Management:** Gestão de ciclo de vida de usuários e controle de acessos (IAM).
* **Access Control:** Implementação de permissões avançadas e segurança de arquivos.
* **System Hardening:** Aplicação de políticas para redução da superfície de ataque.
* **Security Automation:** Desenvolvimento de ferramentas para auditoria e automação de segurança.

## Laboratórios e Casos de Uso
#### **Lab 01: Gestão de Usuários e Password Compliance**
**Objetivo:** Provisionamento de contas e auditoria de políticas de segurança.

* **IAM Dashboard (Cockpit):** [Ver Evidência](docs/assets/iam-cockpit.png)
* **Security Audit (CLI):** [Ver Evidência](docs/assets/user-audit-cli.png)

**Resumo Técnico:**
- Implementação de acesso restrito via grupo `wheel` (Sudoers).
- Verificação de conformidade de senhas com o comando `chage`.
- Ajuste de permissões críticas (Restricted `/home` to `700`).

## Scripts e Automação
Ferramentas desenvolvidas para otimizar a infraestrutura de segurança:

* [**init_repo2.sh**](./init_repo2.sh): Script de automação para organização do workspace e padronização de logs de segurança.

## Metodologia e Evidências de Processo
Documentação aplicada para garantir padrões de nível **Enterprise**.

* **[Estrutura de Diretórios](docs/assets/projeto-estrutura-git.png)**: Organização profissional de pastas.
* **[Ciclo de Vida Git](docs/assets/evidencia-deploy-local.png)**: Gerenciamento de versão via CLI.
* **[Workflow de Documentação](docs/assets/documentation-workflow-vim.png)**: Elaboração técnica via Vim.

---

## 🌎 Global Outreach (Technical Keywords)
Este repositório segue padrões internacionais. Termos técnicos, logs e mensagens de erro são mantidos em Inglês para fidelidade ao mercado global.

`IAM`, `Identity Management`, `System Hardening`, `User Auditing`, `Compliance`, `Linux Security`, `Access Control Lists (ACLs)`.
