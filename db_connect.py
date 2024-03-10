import psycopg2


def check_postgresql_connection(hostname, port, username, password, database):
    try:
        # Подключение к базе данных
        conn = psycopg2.connect(
            host=hostname,
            port=port,
            user=username,
            password=password,
            database=database
        )

        # Проверка соединения
        cursor = conn.cursor()
        cursor.execute("SELECT version()")
        db_version = cursor.fetchone()
        print(f"Успешное подключение к PostgreSQL. Версия сервера: {db_version[0]}")

        # Закрытие соединения
        cursor.close()
        conn.close()

        return True

    except Exception as e:
        print(f"Ошибка при попытке подключения к серверу PostgreSQL: {e}")
        return False


# Задаем параметры подключения
hostname = '172.22.0.2'
port = '5432'
username = 'skovorodko'
password = 'alexander'
database = 'chinook'

# Проверяем подключение
if check_postgresql_connection(hostname, port, username, password, database):
    print("Подключение к серверу PostgreSQL успешно")
else:
    print(
        "Не удалось подключиться к серверу PostgreSQL. Пожалуйста, проверьте параметры подключения и убедитесь, что сервер запущен.")

# SS
# skovorodko
# alexander