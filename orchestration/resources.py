from pathlib import Path

from dagster_dbt import DbtCliResource

DBT_PROJECT_DIR = Path(__file__).resolve().parent.parent / "transformations"

dbt_resource = DbtCliResource(
    project_dir=DBT_PROJECT_DIR,
    profiles_dir=Path.home() / ".dbt",
)