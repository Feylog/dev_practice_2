FROM apache/superset

USER root

RUN apt-get update && apt-get install -y gcc g++ python3-dev libffi-dev
RUN pip install "sqlalchemy<2.0.0" psycopg2-binary clickhouse-sqlalchemy

USER superset