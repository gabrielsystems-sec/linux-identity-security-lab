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
Implementação de controle granular via Cockpit e ACLs para rastreabilidade total de sessões.
![IAM Cockpit](docs/assets/iam-cockpit.png)

### 2. Integridade e Detecção de Intrusão (FIM)
Configuração do **Tripwire** para monitoramento de arquivos críticos e auditoria via **Lynis**.
* **Resultado:** Hardening Index 68 (Acima da média de mercado para setups iniciais).
![Lynis Index](docs/assets/lynis-hardening-index-68.png)

### 3. Defesa de Perímetro (Firewall & SSH)
Blindagem de SSH na porta 2222, bloqueio de força bruta com Fail2Ban e regras ricas de firewall.
![Auditoria Final](docs/assets/auditoria-final-hardening.png)

### 4. Resolução de Conflitos de Kernel (NVIDIA/CUDA)
* **Incidente:** Mismatch entre bibliotecas NVML e módulos de Kernel.
* **Solução:** Saneamento de repositórios e deploy do Driver 580 (Open Kernel) para suporte a CUDA 13.
![Troubleshooting Kernel](docs/assets/troubleshooting-nvidia-mismatch-and-repo-cleanup.png)
![Setup Final](docs/assets/final-setup-rtx4050-driver-580-cuda-13.png)

---

## ⚙️ Automação de Auditoria e Saúde (Toolkit)
Desenvolvimento de um conjunto de ferramentas em Shell Script para garantir a conformidade e a disponibilidade do sistema:

* **`security_audit.sh`**: Validação de conformidade (SELinux, SSH, Firewalld e Tripwire).
* **`check_system_health.sh`**: Diagnóstico proativo de recursos críticos (CPU/RAM/Disco).
* **`monitor_sistema.sh`**: Monitoramento contínuo de logs e processos ativos para detecção de anomalias.

**Execução da Auditoria de Segurança:**
![Security Audit Execution](docs/assets/security-audit-execution.png)

---

## 🛡️ Diferenciais de Operação (SRE Mindset)

* **Compilação Manual (Nmap 7.98):** Domínio do ciclo de vida de software, compilando binários direto da fonte para maior controle e segurança.
![Nmap Success](docs/assets/nmap-compilation-success.png)
* **SELinux Proativo:** Operação em modo *Permissive* para mapeamento de contextos e criação de políticas personalizadas, evitando o erro comum de desativar a proteção.
* **Vim as IDE:** Todo o setup e documentação realizados via CLI, demonstrando agilidade em ambientes headless.

---

## 📂 Estrutura do Projeto
* `scripts/`: Toolkit de auditoria e monitoramento.
* `docs/assets/`: Evidências de hardening e relatórios de auditoria.

---
## ⏭️ Próxima Etapa
A segurança aqui estabelecida garante a integridade para as métricas e logs coletados no **[Repo 3: System Health & Observability](https://github.com/gabrielsystems-sec/system-observability-hub)**.
