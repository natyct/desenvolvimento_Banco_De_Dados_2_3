# desenvolvimento_Banco_De_Dados_2_3
# Projeto SQLite com Trigger

## Descrição

Projeto desenvolvido em SQLite para demonstrar a criação de banco de dados, tabelas, relacionamentos e triggers.

## Tabelas

### Alunos

* id
* nome
* curso
* idade
* email

### Professores

* id
* nome
* disciplina
* salario

### Disciplinas

* id
* nome
* carga_horaria

### Matriculas

* id
* aluno_id
* disciplina_id
* semestre

### LogAlunos

* id_log
* nome_aluno
* acao
* data_registro

## Trigger

A trigger `trg_aluno_insert` é executada após um INSERT na tabela Alunos.

Sua função é registrar automaticamente no log o cadastro de novos alunos.

## Tecnologias

* SQLite
* DB Browser for SQLite
* GitHub
