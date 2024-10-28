# Algotrading Lab

This repository of examples to integrate API, Mocks, Testing

## Python Version

3.10

## Development Setup

This project uses poetry as dependency management. To install poetry run:

```bash
curl -sSL https://install.python-poetry.org | python - --version 1.3.2
```

Now that you have poetry you can install all the project dependencies (default, linters, test) with:

```bash
poetry env use 3.10
source $(poetry env info --path)/bin/activate
poetry install --no-root
```


## Migration

Initial migration script

```bash
alembic revision --autogenerate -m "Initial migration"
```

Apply migration
```bash
alembic upgrade head
```


## Directory


| Path                              | Description                    | Done  |
|-----------------------------------|--------------------------------|-------|
| alembic                           | migrations                     | true  |
| app                               | API                            | false |
| orm                               | database model with SQLAlchemy | true  |
| scripts                           | help files                     | true  |
| tests                             | example test                   | true  |
