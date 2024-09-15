# テスト実施とモデル構築
dbt build

# dbt docsを作成
dbt docs generate

# テスト結果のレポートを作成
edr report

# GCSバケットにデプロイ
gsutil -m cp -r target/* gs://dbt_documents_shingo_ikeda/dbt_docs/
gsutil -m cp -r edr_target/* gs://dbt_documents_shingo_ikeda/elementary_report/