# 📚 Sistema Acadêmico

Sistema Acadêmico desenvolvido para fins de estudo e prática de programação, modelagem de dados e manipulação de banco de dados.  
O projeto busca simular funcionalidades de um sistema de gestão acadêmica, permitindo o cadastro de alunos, professores, cursos e disciplinas.

---

## ✨ Funcionalidades

- Cadastro e gerenciamento de:
  - **Alunos**
  - **Professores**
  - **Disciplinas**
  - **Turmas**
  - **Cursos**
  - **Faculdades/Filiais**
- Controle de **matrículas**
- Registro de **notas** e **histórico escolar**
- Consultas SQL (SELECT, UPDATE, DELETE)
- Scripts prontos para popular o banco
- Modelagem de dados documentada em PDF  

---

## 🛠 Tecnologias Utilizadas

- **Linguagem:** Java  
- **Banco de Dados:** MySQL  
- **Ferramentas:** Git & GitHub  
- **Modelagem:** DER / SQL (arquivo `diagrama_modelagem_sql.pdf`)  

---

## 📂 Estrutura do Projeto
```bash
SistemaAcademico/
├─ src/ # Código-fonte em Java
├─ scripts/ # Scripts SQL
├─ diagrama_modelagem_sql.pdf # Diagrama do banco de dados
├─ Selects_Updates.sql # Consultas SQL de exemplo
├─ Database_populada.sql # (na branch específica) Banco já populado
├─ README.md # Documentação
```
---

## 🌿 Branches

- **main** → versão principal do projeto  
- **Database_populada.sql** → branch com banco **já populado**  

📌 Para acessar:
```bash
git checkout Database_populada.sql
```
## Banco populado

O script Database_populada.sql contém:

- Criação do banco Sistema_Academico

- Estrutura de todas as tabelas

- Dados iniciais com INSERT INTO
```bash
📊 Dados incluídos
Entidade	             Quantidade
Pessoas	                   10
Alunos	                   5
Professores	               5
Faculdades	               3
Cursos	                   6
Turmas	                   6
Disciplinas	               8
Matrículas	               6
Histórico Escolar	       3
```
⚙️ Como Executar

Clone o repositório:
```bash
git clone https://github.com/KimCarolyna/SistemaAcademico.git
```
Configure o MySQL:

Crie um banco chamado Sistema_Academico

Execute o script SQL da branch desejada:
```bash
SOURCE Database_populada.sql;
```

## 🗄 Modelagem de Dados

O sistema possui as seguintes entidades principais:

Pessoa → base para alunos e professores

Aluno → herda de pessoa

Professor → herda de pessoa

Curso

Disciplina

Turma

Matrícula

Histórico Escolar

Faculdade/Filial

## 📌 O diagrama e as queries estão em:

diagrama_modelagem_sql.pdf

Selects_Updates.sql
