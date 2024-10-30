# Projeto de API Node.js com PostgreSQL e Docker

Este projeto é uma API simples que lista alunos de uma tabela `students` armazenada em um banco de dados PostgreSQL. A aplicação foi desenvolvida em Node.js e containerizada com Docker, e também inclui o PgAdmin para gerenciar o banco de dados.

## Pré-requisitos

Antes de começar, você precisa ter instalado:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Estrutura do Projeto

```
/meu-projeto
│
├── index.js               # Código da aplicação Node.js
├── package.json           # Definições de dependências Node.js
├── package-lock.json      # Arquivo de bloqueio de dependências do Node.js
├── Dockerfile             # Dockerfile para construir a imagem da aplicação
├── docker-compose.yml     # Arquivo para orquestrar os serviços do Docker
└── init.sql               # Script SQL para inicializar o banco de dados
```

## Instalação e Configuração

Siga as instruções abaixo para configurar e iniciar o projeto:

### 1. Clone o Repositório

Clone este repositório em sua máquina local:

```bash
git clone <URL_DO_REPOSITORIO>
cd meu-projeto
```

### 2. Instale as Dependências Node.js

No diretório do projeto, instale as dependências da aplicação:

```bash
docker run --rm -v $(pwd):/usr/src/app -w /usr/src/app node:20-alpine3.20 npm install
```

### 3. Configuração do Docker Compose

O arquivo `docker-compose.yml` define três serviços:
- **app**: A aplicação Node.js que conecta ao PostgreSQL e expõe o endpoint `/students`.
- **db**: O banco de dados PostgreSQL, com configurações para criar automaticamente o banco de dados `school`.
- **pgadmin**: Interface web de administração para o PostgreSQL.

### 4. Script SQL de Inicialização

O script `init.sql` cria a tabela `students` e insere alguns dados iniciais. Ele é executado automaticamente na primeira vez em que o banco de dados PostgreSQL é inicializado.

## Como Executar

No diretório do projeto, execute o seguinte comando para iniciar todos os serviços:

```bash
docker-compose up -d --build
```

Esse comando:
1. **Constrói** a imagem Docker para a aplicação Node.js.
2. **Inicia** o banco de dados PostgreSQL, cria a tabela `students` e insere dados de exemplo.
3. **Inicia** o PgAdmin, acessível pela porta `8080`.

A aplicação Node.js estará disponível na porta `3000`.

## Acessando os Serviços

- **API Node.js**: Acesse `http://localhost:3000/students` para ver a lista de alunos.
- **PgAdmin**: Acesse `http://localhost:8080` para gerenciar o banco de dados PostgreSQL.
  - **Email**: `admin@example.com`
  - **Senha**: `admin`

## Testando o Endpoint

Para testar o endpoint `/students`, você pode usar o seguinte comando `curl`:

```bash
curl http://localhost:3000/students
```

Esse comando deve retornar um JSON com a lista de alunos.

## Parando os Serviços

Para parar e remover todos os contêineres, execute:

```bash
docker-compose down
```

Isso interromperá todos os serviços e manterá os dados do PostgreSQL no volume `postgres_data`, permitindo que você preserve os dados mesmo ao reiniciar os contêineres.

## Troubleshooting

- **Erro de conexão com o banco de dados**: Verifique se os contêineres `app` e `db` estão em execução. Certifique-se de que a variável `PGHOST` está configurada como `db` no `docker-compose.yml`.
- **PgAdmin não acessível**: Verifique se a porta `8080` não está em uso no host.

## Apresentação
https://docs.google.com/presentation/d/118UaxvclcU4acFr9k73sJKQU5D_lT7hmthW1MQBhuFA/edit?usp=sharing

## Licença

Este projeto é de uso livre e foi criado para fins educacionais.
