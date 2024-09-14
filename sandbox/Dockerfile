FROM ghcr.io/dbt-labs/dbt-bigquery:latest

ARG PROJECT_DIR
# プロジェクトディレクトリをコンテナ内にマウント
COPY ${PROJECT_DIR} /app
# ワークディレクトリに設定
WORKDIR /app/${PROJECT_DIR}

# コンテナ起動時にデフォルトで実行されるコマンド
ENTRYPOINT ["/app/entrypoint.sh"]
