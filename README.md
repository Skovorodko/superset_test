# Построение графиков в Apache Superset

Этот проект демонстрирует процесс построения графиков в Apache Superset на основе данных из PostgreSQL. Он включает в себя полную настройку и использование связки Postgres + Superset через `docker-compose.yml`. Все действия выполнены в среде Linux, начиная от создания бэкапов базы данных до миграции данных между Postgres и Superset и запуска приложений с помощью `docker-compose up`. 
Исходные данные хранятся в базе данных **'chinook'**, доступ к которой осуществеляется через Postgres. 

## О проекте

Проект основан на использовании официальных образов Postgres и Superset с Docker Hub. Целью проекта является демонстрация возможностей Apache Superset для визуализации данных, хранящихся в базе данных PostgreSQL. В процессе реализации я использовал Linux для управления базой данных, включая создание бэкапов и миграцию данных, а также для запуска контейнеров Docker.

Для построения графиков в Superset применялись SQL запросы, которые я сохранил в директории `superset_graphs` под файлом `sql_queries.sql`. На основании этих запросов я построил различные типы графиков.

## Работа с базами данных
Изначально проект настроен для работы с базой данных superset,
но в процессе было решено использовать базу данных chinook 
для демонстрации возможностей визуализации. В файле 
docker-compose.yml заданы параметры для подключения 
к базе данных PostgreSQL, что позволяет легко добавлять
и управлять дополнительными базами данных.
Также можно добавлять дополнительные базы данных, обновляя `docker-compose.yml`.




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
cat chinook_db_backup.sql | docker exec -i superset-db psql -U skovorodko -d chinook
```



**База данных** 
Chinook_PostgreSql.sql : https://github.com/lerocha/chinook-database


