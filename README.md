# dbtの練習用リポジトリ
業務で必要なdbtのスキルを習得するために作成しました。

## dbt coreの導入方法
①pythonをインストール  
②「pip install dbt-bigquery」を実行する
　「dbt --version」でインストールできたか確認する。  
③gcloudをインストール  
④bigqueryにクエリを発行するアカウントでログイン  
gcloud auth application-default login  
⑤dbt用のフォルダを作成  
⑥profiles.ymlのパスを作成する（デフォルトではuser\.dbt\に配置される）  
DBT_PROFILES_DIR=C:\Users\user\dbt_sandbox\sandbox  
⑦⑤で作成したフォルダでdbt initを実行  
⑧macros配下に「get_custom_schema.sql」を作成し、下記をコピペする（これを設定しないと、データセット名が「profiles.ymlのdataset名_dbt_project.ymlで設定したデータセット名」になってしまう）  
```
{% macro generate_schema_name(custom_schema_name, node) -%} 
  {%- set default_schema = target.schema -%}
  {%- if custome_schema_name is none -%}
    {{ default_schema }}
  {%- else -%}
    {{ custom_schema_name | trim }}
  {%- endif -%}
{%- endmacro %}
```
⑨dbt_project.ymlをのmodelを下記に書き換える  
```
models:
  sandbox:
    # Config indicated by + and applies to all files under models/example/
    stg_test:
      +schema: 'stg_test'
      +materialized: 'table'
```
⑩models下のexampleフォルダを削除  
⑪modesl下にstg_testフォルダを作成  
⑫stg_testフォルダ下にsource.ymlとstg_test_table.sqlを作成  
source.yml
```
version: 2

sources:
  - name: raw_test
    schema: raw_test
    tables:
      - name: test_table
        columns:
          - name: id
            description: 'id'
            data_type: INT64
          - name: name
            description: '名前'
            data_type: STRING
          - name: age
            description: '年齢'
            data_type: INT64
          - name: sex
            description: '性別'
            data_type: STRING
```
stg_test_table.sql
```
with source as (
      select * from {{ source('raw_test', 'test_table') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("name") }},
        {{ adapter.quote("age") }},
        {{ adapter.quote("sex") }}

    from source
)
select * from renamed
```
⑬dbt runを実行  

## dbt docsの利用方法
dbt docs generate  
dbt docs serve  

## dbt-osmosisの導入方法
①pip install dbt-osmosis  
②dbt_project.ymlのメタデータを作成したいデータセットに下記を追加  
`+dbt-osmosis: "{model}.yml"`  
③下記を実行するとstg_testデータセット下のモデルのメタデータが作成される  
`dbt-osmosis yaml refactor -f stg_test`  

## elementaryの導入方法
参考：https://zenn.dev/hananah/articles/566a351ea46f30  
①packages.ymlを作成し、下記を記載する
```
packages:
  - package: elementary-data/elementary
    version: 0.16.0
```
②「dbt deps」を実行する  
「別のプロセスが使用中です。」というエラーメッセージが発生した場合、「dbt clean」を実行する  
③「pip3 install 'elementary-data[bigquery]'」を実行する  
④下記コマンドでインストールできたことを確認する  
`edr --version`  
⑤dbt_project.ymlに下記を追加する
```
models:
  ## see docs: https://docs.elementary-data.com/
  elementary:
    ## elementary models will be created in the schema '<your_schema>_elementary'
    +schema: "elementary"
    ## To disable elementary for dev, uncomment this:
    # enabled: "{{ target.name in ['prod','analytics'] }}"
```
⑥「dbt run --select elementary」を実行する  
⑦profiles.ymlに下記を追加する（「dbt run-operation elementary.generate_elementary_cli_profile」を実行すると提示してくれる）  
```
elementary:
  outputs:
    default:
      type: "bigquery"
      project: "udemy-sql-381210"
      dataset: "elementary"
      method: oauth
      threads: 1
```
⑧「dbt test」を実行する  
⑨「edr report」を実行して、test結果を可視化する 

