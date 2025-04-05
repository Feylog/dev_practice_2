🐘 + 🚀 + 📊

> Docker-based test stand for PostgreSQL, ClickHouse, and Superset. Use this to evaluate query performance and test analytics scenarios.

# Test Stand: PostgreSQL + ClickHouse + Superset

## Состав стенда

- **PostgreSQL** с демо-таблицей
- **ClickHouse** с подключением к PostgreSQL через движок PostgreSQL
- **Apache Superset** как BI-интерфейс

## Запуск

```bash
docker-compose up -d
```

## Установка на удаленный сервер в Yandex Cloud

### 1. Подготовка ВМ

1. Зайди в [Yandex Cloud](https://cloud.yandex.ru/) и создай виртуальную машину (ВМ) на базе Ubuntu (например, `ubuntu-22.04`).
2. Укажи минимальные характеристики:
   - 2 vCPU, 4 ГБ RAM
   - 20+ ГБ SSD
3. Разреши вход по SSH и добавь свой публичный SSH-ключ.

#### 📌 Рекомендуется: Назначить статический IP

По умолчанию IP-адрес может меняться при перезагрузке ВМ. Чтобы этого избежать:

1. Перейди в [Yandex Cloud → VPC → Static IP addresses](https://console.cloud.yandex.ru/vpc/addresses)
2. Нажми **"Создать"** и выбери:
   - Название: например, `superset-ip`
   - Зона доступности: такая же, как у ВМ (например, `ru-central1-a`)
3. После создания нажми **"Привязать"** и выбери нужную ВМ

Теперь IP-адрес будет постоянным, и ты всегда сможешь обращаться к Superset по одному и тому же адресу.

### 2. Подключение к серверу

```bash
ssh ubuntu@<EXTERNAL_IP>
```

### 3. Установка Docker и Docker Compose

```bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
newgrp docker
```

Проверь установку:

```bash
docker -v
docker-compose -v
```

### 4. Клонирование проекта

```bash
git clone <URL_ВАШЕГО_РЕПОЗИТОРИЯ>
cd <ИМЯ_ПАПКИ_ПРОЕКТА>
```

### 5. Запуск стенда

```bash
docker-compose up -d
```

### 6. Установка драйверов PostgreSQL и ClickHouse для Superset

Superset требует ручной установки дополнительных Python-библиотек. Мы используем кастомный Dockerfile, который включает:

- Установку системных зависимостей: `gcc`, `g++`, `python3-dev`, `libffi-dev`
- Фиксированную версию SQLAlchemy (`<2.0.0`), чтобы избежать ошибок с `eagerload`
- Драйверы:
  - `psycopg2-binary` (для PostgreSQL)
  - `clickhouse-sqlalchemy` (для ClickHouse)

Если всё настроено правильно, Superset будет готов к использованию после запуска `docker-compose`.

### 7. Доступ

- Superset: `http://<EXTERNAL_IP>:8088`
  - Логин: `admin`
  - Пароль: `admin`

# .gitignore

```
# Docker volumes
pg_data/
ch_data/
superset_home/

# Python
__pycache__/
*.pyc

# Editor files
.vscode/
.idea/

# System
.DS_Store
.env
```
