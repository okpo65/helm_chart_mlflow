#!/bin/sh

set -e

if [ -z $AWS_BUCKET ]; then
  echo >&2 "AWS_BUCKET must be set"
  exit 1
fi

if [ -z $AWS_ACCESS_KEY_ID ]; then
  echo >&2 "AWS_ACCESS_KEY_ID must be set"
  exit 1
fi

if [ -z $AWS_SECRET_ACCESS_KEY ]; then
  echo >&2 "AWS_SECRET_ACCESS_KEY must be set"
  exit 1
fi

if [ -z $MLFLOW_S3_ENDPOINT_URL ]; then
  echo >&2 "MLFLOW_S3_ENDPOINT_URL must be set"
  exit 1
fi

if [ -z $MLFLOW_BACKEND_STORE_URI ]; then
  echo >&2 "MLFLOW_BACKEND_STORE_URI must be set"
  exit 1
fi

mlflow server \
    --backend-store-uri $MLFLOW_BACKEND_STORE_URI \
    --artifacts-destination S3://$AWS_BUCKET/mlflow \
    --serve-artifacts \
    --host 0.0.0.0 \
    --port $PORT