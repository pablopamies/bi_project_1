from dagster import ScheduleDefinition

from jobs import dbt_job

daily_schedule = ScheduleDefinition(
    job=dbt_job,
    cron_schedule="0 7 * * *",
)