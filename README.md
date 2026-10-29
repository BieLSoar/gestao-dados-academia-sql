# 🏋️‍♂️ Sistema de Gestão de Academia (FitWorld) - PostgreSQL

Projeto de banco de dados relacional desenvolvido para a disciplina de **Banco de Dados I** (Universidade do Estado do Rio de Janeiro - UERJ), com foco na modelagem conceitual, estruturação, carga de dados e consultas analíticas de uma rede de academias.

## 👥 Autoria e Contribuição em Equipe
* **Juliana Campos:** Modelagem conceitual, criação do MER/DER e comandos estruturais iniciais (`CREATE TABLE`).
* **Gabriel Ferreira Soares:** Elaboração do relatório (diagramas e álgebra relacional), implementação da carga de dados (`INSERT`), testes de integridade (`DELETE`) e desenvolvimento das consultas analíticas avançadas.

---

## 📋 Sobre o Projeto
O sistema simula o ecossistema da rede de academias **FitWorld**, controlando dados de alunos, professores, planos de assinatura, turmas de aulas coletivas, fichas de treino e registros de frequência.

## 🗄️ Modelagem de Dados
O banco foi normalizado até a **3ª Forma Normal (3FN)**, garantindo integridade referencial, restrições de domínio (`NOT NULL`, `UNIQUE`) e chaves primárias/estrangeiras bem definidas entre as 7 tabelas principais:
1. `plano`
2. `professor`
3. `aluno`
4. `aula`
5. `matricula`
6. `treino`
7. `aluno_aula` (Tabela associativa para relação N:N)

---

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** PostgreSQL
* **Conceitos aplicados:** DDL, DML, Restrições de Integridade, Junções (`JOIN`), Agregações (`GROUP BY`, `HAVING`), Álgebra Relacional e Modelagem (MER/DER).

---

## 🔍 Exemplos de Consultas Analíticas Implementadas
O script SQL contém consultas úteis para o negócio, tais como:
* Listagem de alunos com base na especialidade do professor responsável.
* Filtragem de matrículas ativas cruzando dados de alunos e planos.
* Relatório de quantidade de aulas ministradas por professor (`LEFT JOIN` + `GROUP BY`).
* Identificação de alunos inscritos em mais de uma aula coletiva (`HAVING COUNT`).

---
*Desenvolvido por [Gabriel Ferreira Soares](https://github.com/BielSoar).*
