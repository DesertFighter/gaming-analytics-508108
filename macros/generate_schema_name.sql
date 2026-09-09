{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- if custom_schema_name is none -%}

        {{ target.schema }}

    {%- else -%}

        gaming_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}