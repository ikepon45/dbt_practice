# パッケージ間の依存関係を整理（elementaryをインストールしたため、elementaryと依存関係にあるパッケージをインストールする必要がある）
dbt deps

# テスト実施とモデル構築
dbt build

# テスト結果のレポートをGCSバケットにデプロイ
edr send-report --gcs-bucket-name dbt_documents_shingo_ikeda --bucket-file-path elementary_report/elementary_report.html
