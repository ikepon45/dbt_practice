# パッケージ間の依存関係を整理
dbt deps

# テスト実施とモデル構築
dbt build

# dbt docsを作成
dbt docs generate

# テスト結果のレポートを作成
edr report

# サービスアカウントでGoogle Cloudにログイン
gcloud auth activate-service-account github-actions@udemy-sql-381210.iam.gserviceaccount.com --key-file=service-account-key.json

# GCSバケットにデプロイ
gsutil -m cp -r target/* gs://dbt_documents_shingo_ikeda/dbt_docs/
gsutil -m cp -r edr_target/* gs://dbt_documents_shingo_ikeda/elementary_report/
