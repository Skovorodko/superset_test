# superset_test

# Построение графиков в Apache Superset

Этот проект демонстрирует процесс построения графиков в Apache Superset на основе данных из PostgreSQL. Он включает в себя полную настройку и использование связки Postgres + Superset через `docker-compose.yml`. Все действия выполнены в среде Linux, начиная от создания бэкапов базы данных до миграции данных между Postgres и Superset и запуска приложений с помощью `docker-compose up`.

## О проекте

Проект основан на использовании официальных образов Postgres и Superset с Docker Hub. Целью проекта является демонстрация возможностей Apache Superset для визуализации данных, хранящихся в базе данных PostgreSQL. В процессе реализации я использовал Linux для управления базой данных, включая создание бэкапов и миграцию данных, а также для запуска контейнеров Docker.

Для построения графиков в Superset применялись SQL запросы, которые я сохранил в директории `superset_graphs` под файлом `sql_queries.sql`. На основании этих запросов я построил различные типы графиков.

## Начало работы

### Предварительные требования

Убедитесь, что у вас установлены Docker и Docker Compose. Это необходимо для запуска Postgres и Superset в контейнерах. 

### Установка и Запуск

1. **Клонирование репозитория или скачивание проекта**

    Скачайте архив проекта или клонируйте репозиторий с помощью команды:

    ```bash
    git clone https://github.com/Skovorodko/superset_test.git
    cd superset_test
    ```

2. **Запуск контейнеров**

    Используйте `docker-compose` для запуска Superset и Postgres:

    ```bash
    docker-compose up -d
    ```

### Восстановление базы данных

Восстановите базу данных из предоставленного бэкапа с помощью команды:

```bash
cat superset_db_backup.sql | docker exec -i superset-db psql -U skovorodko -d superset
```









**База данных** Chinook_PostgreSql.sql: https://github.com/lerocha/chinook-database


