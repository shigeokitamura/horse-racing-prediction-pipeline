from airflow.sdk.definitions.decorators import dag, task
from datetime import datetime
import duckdb
from pathlib import Path

DAG_DIR = Path(__file__).parent
DB_PATH = DAG_DIR.parent / "data" / "netkeiba.duckdb"
SQL_PATH = DAG_DIR / "sql" / "init_db.sql"


@dag(
    dag_id="init_netkeiba_db",
    default_args={"owner": "airflow"},
    start_date=datetime(2025, 1, 1),
    schedule="@once",
    catchup=False,
    tags=["netkeiba", "setup"],
)
def init_netkeiba_db_dag() -> None:
    @task(task_id="check_and_create_dir")
    def check_and_create_dir() -> None:
        db_dir = DB_PATH.parent
        if not db_dir.exists():
            print(f"Creating directory: {db_dir}")
            db_dir.mkdir(parents=True, exist_ok=True)
        else:
            print(f"Directory already exists: {db_dir}")

    @task(task_id="init_db_schema")
    def init_db() -> None:
        con = duckdb.connect(str(DB_PATH))

        try:
            with open(str(SQL_PATH), "r") as f:
                sql_script = f.read()

            con.execute(sql_script)
            print("Database initialized successfully.")
        except Exception as e:
            print(f"Error initializing database: {e}")
            raise (e)
        finally:
            con.close()

    check_and_create_dir() >> init_db()


init_netkeiba_db_dag()
