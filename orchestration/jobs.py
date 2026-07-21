from dagster import define_asset_job

dbt_job = define_asset_job(
    "dbt_job"
)