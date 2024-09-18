# パッケージ間の依存関係を整理（elementaryをインストールしたため、elementaryと依存関係にあるパッケージをインストールする必要がある）
dbt deps

# テスト実施とモデル構築
dbt build

# テスト結果のレポートを作成
edr report

# サービスアカウントでGoogle Cloudにログイン
gcloud auth activate-service-account --key-file=service-account-key.json

if grep -q "target: prod" profiles.yml; then
    # テスト結果のレポートをGCSバケットにデプロイ
    gsutil -m cp -r edr_target/* gs://dbt_documents_shingo_ikeda/elementary_report/
else
    # テスト結果のレポートをGCSバケットにデプロイ
    gsutil -m cp -r edr_target/* gs://dbt_documents_shingo_ikeda_prod/elementary_report/
fi