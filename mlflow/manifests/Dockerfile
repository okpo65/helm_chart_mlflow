# 기본 이미지 설정
FROM postgres:14.0

# 환경 변수 설정
ENV POSTGRES_USER=mlflow
ENV POSTGRES_PASSWORD=mlflow
ENV POSTGRES_DB=mlflow

# 포트 5432 노출
EXPOSE 5432

# PostgreSQL 데이터 디렉토리 설정 (이미지에 따라 기본 설정될 수 있음)
VOLUME ["/var/lib/postgresql/data"]