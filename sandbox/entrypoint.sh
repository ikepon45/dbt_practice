# パッケージ間の依存関係を整理（elementaryをインストールしたため、elementaryと依存関係にあるパッケージをインストールする必要がある）
dbt deps

# テスト実施とモデル構築
dbt build

# テスト結果のレポートを作成
edr report

# サービスアカウントでGoogle Cloudにログイン
gcloud auth activate-service-account github-actions@udemy-sql-381210.iam.gserviceaccount.com --key-file=service-account-key.json

# テスト結果のレポートをGCSバケットにデプロイ
gsutil -m cp -r edr_target/* gs://dbt_documents_shingo_ikeda/elementary_report/
