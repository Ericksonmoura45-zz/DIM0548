# Linguagem Alpha

A Alpha é uma linguagem de programação voltada para aprendizado de programação, com a proposta de trazer uma experiência com baixa curva de aprendizado, alta legibilidade e uma boa facilidade de leitura.

- [Ambiente de Desenvolvimento](#ambiente-de-desenvolvimento)
- [Desenvolvimento](#desenvolvimento)

## Ambiente de Desenvolvimento

Para montar o ambiente de desenvolvimento é necessário ter instalados os seguintes pacotes:
- gcc 
- flex 
- bison

### Ubuntu

Instalando os pacotes necessários em ambiente Ubuntu
```
$ apt update && apt install -y gcc flex bison
```

### Docker

Criando uma imagem com os requisitos do ambiente de desenvolvimento

```
$ docker-compose up
```

Abrindo terminal interativo com o ambiente criado no passo anterior apontando para a pasta local do projeto. Cada alteração feita nos arquivos dentro do diretório `caminho/absoluto/para/pasta` será replicado no container criado, permitindo a execução do fluxo de compilação

```
$ docker run --name alpha -v caminho/absoluto/para/pasta:/home/root/alpha -it --rm alpha_web  /bin/bash
```

## Desenvolvimento

A linguagem é gerada a partir da execução dos arquivos `lexico.l` e `parser.y`, responsáveis pela análise léxica e sintática respectivamente.

Para gerar o compilador final da linguagem responsável por ler arquivos escritos em Alpha e exportar o código resultante em C simplificado, basta seguir esses passos:

### Criação do analisador léxico

```
lex lexico.l
```

### Criação do analisador sintático

```
yacc parser.y -d -v -g
```

### Criação do executável do compilador 
 
```
gcc lex.yy.c y.tab.c -o alpha.exe
```

### Versão encurtada para compilação completa

```
lex lexico.l && yacc parser.y -d -v -g && gcc lex.yy.c y.tab.c -o alpha.exe
```

### Compilando código Alpha

```
./alpha.exe < ./teste/input02.txt
```
