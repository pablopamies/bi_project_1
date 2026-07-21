from pathlib import Path

from dagster import AssetExecutionContext
from dagster_dbt import dbt_assets

from resources import dbt_resource

MANIFEST_PATH = (
    Path(__file__).resolve().parent.parent
    / "transformations"
    / "target"
    / "manifest.json"
)

@dbt_assets(
    manifest=MANIFEST_PATH,
)
def dbt_assets_project(
    context: AssetExecutionContext,
):
    yield from dbt_resource.cli(
        ["build"],
        context=context,
    ).stream()