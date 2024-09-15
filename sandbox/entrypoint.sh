# テスト実施とモデル作成
dbt build

# テスト結果のレポート作成
edr report

# GCSバケットにデプロイ
gsutil -m cp -r edr_target/* gs://dbt_documents_shingo_ikeda/elementary_report/