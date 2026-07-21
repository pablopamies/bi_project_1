from dagster import Definitions

from assets import dbt_assets_project
from jobs import dbt_job
from resources import dbt_resource
from schedules import daily_schedule
defs = Definitions(
    assets=[dbt_assets_project],
    jobs=[dbt_job],
    schedules=[daily_schedule],
    resources={
        "dbt": dbt_resource,
    },
)
