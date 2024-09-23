# dbt-bigqueryのベースイメージを指定
FROM ghcr.io/dbt-labs/dbt-bigquery:latest

# プロジェクトディレクトリを指定
ARG PROJECT_DIR

# プロジェクトディレクトリをコンテナ内にマウント
COPY ${PROJECT_DIR} /app

# ワークディレクトリに設定
WORKDIR /app/${PROJECT_DIR}

# pythonのライブラリをインストール
RUN pip install -r requirements.txt

# dbt_profiles.ymlのパスを変更する
ENV DBT_PROFILES_DIR="/app"

# entrypoint.shの実行権限を付与
RUN chmod +x /app/entrypoint.sh

# コンテナ起動時にデフォルトで実行されるコマンド
ENTRYPOINT /app/entrypoint.sh
