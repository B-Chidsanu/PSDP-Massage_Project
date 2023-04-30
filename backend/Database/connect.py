DB_USER = "postgres"
DB_PASS = "root"
DB_NAME = "massage"
DB_HOST = "localhost"
DB_PORT = "5432"

postgresqlConfig = "postgresql://{}:{}@{}:{}/{}".format(
    DB_USER,
    DB_PASS,
    DB_HOST,
    DB_PORT,
    DB_NAME,
)