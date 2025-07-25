# Cotações App

## Descrição:

Um aplicativo desenvolvido em Flutter que exibe cotações de moedas em tempo real. O app consome dados da API **[open.er-api.com](https://open.er-api.com/v6/latest/USD)**, proporcionando informações atualizadas sobre as taxas de câmbio.

## Objetivos do Projeto
**Prática de Habilidades**: Desenvolvido como parte de um desafio técnico, o Cotações App visa aprimorar as habilidades em Flutter, incluindo:
* Consumo de APIs
* Navegação entre telas
## Funcionalidades
✅ Lista de moedas com cotações atualizadas

✅ Navegação para página de detalhes da moeda

✅ Conversão correta para BRL

✅ Estilização com ThemeData e CardTheme

✅ Layout responsivo (Web, Android e Desktop)

✅ Execução em emulador e dispositivo real
## Tecnologias Utilizadas
* Flutter 3.x
* Dart
* API REST [open.er-api.com](https://open.er-api.com/v6/latest/USD)
* Android Studio / VS Code
* Git e GitHub

## Instruções para Executar o Cotações App no Linux

Para clonar e executar o projeto, siga os passos abaixo:

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/cotacoes_app.git

# Acesse o diretório
cd cotacoes_app

# Instale as dependências
flutter pub get

# Execute no dispositivo desejado (emulador, web, etc)
flutter run -d chrome
```
## Instruções para Executar o Cotações App no Windowns

Para clonar e executar o projeto, siga os passos abaixo:

###  1. Pré-requisitos

Antes de tudo, certifique-se de que:

- Você tem o **Flutter** instalado no seu PC ([guia de instalação para Windows](https://docs.flutter.dev/get-started/install/windows)).
- Você tem o **Visual Studio** instalado com a carga de trabalho **"Desenvolvimento de Desktop com C++"**.
- O canal do Flutter está como **stable** e o suporte ao Windows está habilitado:

```
flutter doctor


```
### 2. Executar em Modo de Desenvolvimento (com hot reload)
Para rodar o aplicativo diretamente no seu sistema Windows durante o desenvolvimento:
```
# Clone o repositório do projeto
git clone https://github.com/seu-usuario/cotacoes_app.git

# Acesse a pasta do projeto
cd cotacoes_app

# Instale as dependências
flutter pub get

# Execute no Windows
flutter run -d windows
```
## Autor (a)
Desenvolvido por Diandre Bruce

Desafio técnico para a Talent Lab - 2025

## Licença
Este projeto está sob a licença MIT.
