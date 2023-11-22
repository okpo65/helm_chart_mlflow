FROM python:3.8-slim-buster
LABEL maintainer="Jihwan Kim <okpo65@gmail.com>"

# Build dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends build-essential libpq-dev

ENV AWS_BUCKET mlflow
ENV AWS_ACCESS_KEY_ID s3_access_key_id
ENV AWS_SECRET_ACCESS_KEY s3_secret_access_key
ENV MLFLOW_S3_ENDPOINT_URL http://minio-service.kubeflow.svc.cluster.local:9000
ENV PORT 5000

EXPOSE $PORT

RUN mkdir -p /tmp/mlflow
ENV MLFLOW_BACKEND_STORE_URI file:///tmp/mlflow

RUN mkdir -p /opt/mlflow

ARG MLFLOW_VERSION=1.30.1
RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir mlflow==$MLFLOW_VERSION boto3 psycopg2-binary

COPY run.sh /opt/mlflow
RUN chmod -R 777 /opt/mlflow/

ENTRYPOINT ["/opt/mlflow/run.sh"]