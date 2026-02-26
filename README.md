# Repo 2: Identity, Access & Cybersecurity 🛡️

Este repositório documenta a blindagem de um servidor Rocky Linux 9, transformando-o em uma infraestrutura resiliente e auditável. O foco foi a implementação de camadas de defesa em profundidade para proteção de dados e controle de acesso.

---

## Resumo do Hardening (Resultados Reais)

Aqui estão os pilares de segurança implementados. Clique para ver os detalhes técnicos de cada camada.

<details>
<summary><b> 1. Gestão de Identidade (IAM)</b></summary>

* Implementação de ACLs para controle granular de arquivos.
* Auditoria de sessões de usuários para rastreabilidade total.
* **Evidência principal:** [![IAM Cockpit](docs/assets/iam-cockpit.png)](docs/assets/iam-cockpit.png)
</details>

<details>
<summary><b> 2. Integridade e Proteção de Dados (FIM)</b></summary>

* Configuração de **Tripwire** para detecção de intrusão e alteração de arquivos críticos.
* Criptografia de disco via **LUKS** para segurança em repouso.
* **Status final:** [![Hardening Index 68](docs/assets/lynis-hardening-index-68.png)](docs/assets/lynis-hardening-index-68.png)
</details>

<details>
<summary><b> 3. Defesa de Perímetro e Rede</b></summary>

* SSH blindado na porta 2222 e bloqueio de força bruta com **Fail2Ban**.
* Regras ricas de Firewall com logging ativo para auditoria de ataques.
* **Configuração ativa:** [![Auditoria Final](docs/assets/auditoria-final-hardening.png)](docs/assets/auditoria-final-hardening.png)
</details>

---

## Diferenciais Técnicos (SRE & Troubleshooting)

Para este projeto, não utilizei apenas instaladores automáticos, trabalhei na base do sistema para garantir flexibilidade:

### **Compilação Manual (Nmap 7.98)**
Domínio sobre o ciclo de vida de softwares, compilando ferramentas direto do código-fonte para maior segurança, controle de dependências e otimização de binários.
[![Nmap Success](docs/assets/nmap-compilation-success.png)](docs/assets/nmap-compilation-success.png)

### **Automação via Systemd**
Criação de serviços customizados para monitoramento de recursos (RAM e Logs), garantindo visibilidade total do ambiente e persistência de métricas.
[![Systemd Monitoring](docs/assets/ssh-hardening-selinux-resolution.png)](docs/assets/ssh-hardening-selinux-resolution.png)

### **Troubleshooting de Kernel & Otimização de Hardware**
Resolução de conflitos de drivers críticos e saneamento de infraestrutura para suporte a tecnologias de alto desempenho.
* **Resolução de Driver/Library Mismatch**: Identificação e correção de conflito entre bibliotecas NVML e módulos de Kernel, restaurando a operação da GPU sem necessidade de formatação do **SO**.
* **Deploy de Driver NVIDIA 580 (Open Kernel)**: Implementação da versão estável recomendada, habilitando suporte nativo ao **CUDA 13.0** e aceleração de hardware.
* **Evidência do Debug**: [![Troubleshooting](docs/assets/troubleshooting-nvidia-mismatch-and-repo-cleanup.png)](docs/assets/troubleshooting-nvidia-mismatch-and-repo-cleanup.png)
* **Evidência do Setup Final**: [![NVIDIA Driver 580](docs/assets/final-setup-rtx4050-driver-580-cuda-13.png)](docs/assets/final-setup-rtx4050-driver-580-cuda-13.png)

---

## Metodologia Prática
* **SELinux Proativo:** Mantive o SELinux em modo *Permissive* para mapear contextos e criar políticas reais, em vez de simplesmente desativar a segurança.
* **Vim as IDE:** Todo o setup foi documentado e editado via terminal, demonstrando agilidade em ambientes sem interface gráfica.

---

## ⏭️ Próximos Passos
Concluída a segurança. Futura atualização somente para incluir SQLite.

---
<p align="center">
  <b>[<a href="docs/assets/">Clique aqui para ver a Galeria Completa de Evidências Técnicas</a>]</b>
</p>
