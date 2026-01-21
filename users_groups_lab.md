# Laboratório de Gestão de Usuários e Grupos

## Identificação de Usuário (Aula 41)
No Linux, cada usuário é identificado por um UID (User ID). Através do comando `id`, verifiquei as informações do meu usuário atual:

- **Usuário:** gabriel
- **UID:** 1000 (Primeiro usuário comum do sistema)
- **Grupo Principal:** 1000 (gabriel)
- **Grupos Secundários:** 10 (wheel) -> Permite execução de comandos como superusuário (sudo).

### Arquivos Críticos Consultados:
- `/etc/passwd`: Armazena informações das contas de usuário.
- `/etc/group`: Armazena informações dos grupos.
