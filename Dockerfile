FROM apache/airflow:3.1.3-python3.13

USER root
# Install any system dependencies here if needed

USER airflow

RUN pip install apache-airflow-providers-fab connexion flask-appbuilder flask-session flask-login
