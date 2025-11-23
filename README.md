# horse-racing-prediction-pipeline

## Setup

### Setting the right Airflow user
```
mkdir -p ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)" > .env
```

### Initialize the database
```
docker compose up airflow-init
```

### Running Airflow
```
docker compose up
```
