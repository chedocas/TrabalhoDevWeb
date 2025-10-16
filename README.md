# Trabalho DevWeb (SGEA)

## Desenvolvido por:
Pedro Cezar Pires Henriques
Ian Mensitieri

**SGEA - Sistema de Gestão Escolar Acadêmica** desenvolvido como parte do trabalho da disciplina de Desenvolvimento Web.  
O sistema foi construído em **Python/Django** e tem como objetivo gerenciar dados acadêmicos, como alunos, cursos, professores e turmas.

## Funcionalidades

- Cadastro, edição e exclusão de **alunos**, **professores**, **turmas** e **disciplinas**
- Relacionamento entre entidades (ex: alunos em turmas)
- Interface web simples e responsiva
- Autenticação de usuários (login/logout)
- Banco de dados **SQLite3**
- Painel administrativo padrão do Django

## Tecnologias utilizadas

- **Python 3.12+**
- **Django 5.x**
- **SQLite3**
- **HTML5, CSS3 e Bootstrap**
- **JavaScript (opcional, para interações básicas)**

## Como executar o projeto
```bash

git clone https://github.com/usuario/SGEA.git
cd SGEA

python -m venv venv
venv\Scripts\activate     # Windows
source venv/bin/activate  # Linux/macOS

pip install -r requirements.txt

python manage.py migrate

python manage.py createsuperuser

python manage.py runserver


