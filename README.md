# Robot Framework + AutoItLibrary para testes de aplicações desktop no Windows

## Pré-requisitos

- [Python](https://www.python.org/)
- [Robot Framework](https://robotframework.org/)
- [AutoIt](https://www.autoitscript.com/site/autoit/downloads/)
- [AutoItLibrary](https://github.com/nokia/robotframework-autoitlibrary)

---

## Configuração do Ambiente

### 1. Instalar o Robot Framework

```bash
pip install robotframework
```

### Instalar o AutoIt

- Acesse: https://www.autoitscript.com/site/autoit/downloads/
- Baixe e instale o AutoIt Full Installation
- Durante a instalação, marque a opção AutoItX / COM

> ℹ️ A escolha entre 32-bit (x86) ou 64-bit (x64) deve coincidir com a arquitetura do seu Python.

### 3. Instalar a AutoItLibrary

```bash
pip install robotframework-autoitlibrary
```

Repositório: https://github.com/nokia/robotframework-autoitlibrary

---

## ▶️ Executando os Testes

### Rodar todos os testes

```bash
robot test.robot
```

### Rodar apenas testes com tag `smoke`

```bash
robot --include smoke test_autoitlibrary.robot
```

### Rodar um caso de teste específico

```bash
robot --test "Abrir Aplicacao E Verificar Elemento" test_autoitlibrary.robot
```

---

## Arquivos e Ferramentas Importantes

### Documentação da AutoItLibrary

Local padrão após instalação:

```
C:\RobotFramework\Extensions\AutoItLibrary
```

### AutoIt Window Info Tool

Ferramenta para descobrir identificadores de controle em GUIs do Windows.

Local típico:

```
C:\RobotFramework\Extensions\AutoItLibrary\Au3Info.exe
```

### Inspect.exe (Windows)

Ferramenta para inspecionar elementos de janelas nativas.

- Requer o [Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/)

Caminho típico:
```
C:\Program Files (x86)\Windows Kits\10\bin\<última-release>\x64\inspect.exe
```

---