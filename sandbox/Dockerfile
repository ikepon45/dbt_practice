# dbt-bigqueryのベースイメージを指定
FROM ghcr.io/dbt-labs/dbt-bigquery:latest

# プロジェクトディレクトリを指定
ARG PROJECT_DIR

# プロジェクトディレクトリをコンテナ内にマウント
COPY ${PROJECT_DIR} /app

# ワークディレクトリに設定
WORKDIR /app/${PROJECT_DIR}

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean

# pythonのライブラリをインストール
RUN pip install -r requirements.txt

# Google Cloud SDK をダウンロードしてインストール
RUN curl -sSL https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz | tar -xz -C /usr/local && \
    /usr/local/google-cloud-sdk/install.sh

# Google Cloud SDK のパスを環境変数に追加
ENV PATH="/usr/local/google-cloud-sdk/bin:${PATH}"

# dbt_profiles.ymlのパスを変更する
ENV DBT_PROFILES_DIR="/app"

# entrypoint.shの実行権限を付与
RUN chmod +x /app/entrypoint.sh

# コンテナ起動時にデフォルトで実行されるコマンド
ENTRYPOINT ["/app/entrypoint.sh"]
