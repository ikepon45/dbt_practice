# パッケージ間の依存関係を整理（elementaryをインストールしたため、elementaryと依存関係にあるパッケージをインストールする必要がある）
dbt deps

# テスト実施とモデル構築
dbt build

# テスト結果のレポートを作成
# edr report

# テスト結果のレポートをGCSバケットにデプロイ
edr send-report --gcs-bucket-name dbt_documents_shingo_ikeda --bucket-file-path elementary_report/elementary_report.html

# サービスアカウントでGoogle Cloudにログイン
# gcloud auth activate-service-account --key-file=service-account-key.json

# if grep -q "target: dev" profiles.yml; then
#     # テスト結果のレポートを検証環境のGCSバケットにデプロイ
#     gsutil -m cp -r edr_target/elementary_report.html gs://dbt_documents_shingo_ikeda/elementary_report/
# else
#     # テスト結果のレポートを本番環境のGCSバケットにデプロイ
#     gsutil -m cp -r edr_target/elementary_report.html gs://dbt_documents_shingo_ikeda_prod/elementary_report/
# fi
