{% macro generate_schema_name(custom_schema_name, node) -%}

    {% if node.resource_type == 'snapshot' %}
        SNAPSHOTS

    {% elif custom_schema_name is none %}
        {{ target.schema }}

    {% else %}
        {{ custom_schema_name | trim }}

    {% endif %}

{%- endmacro %}