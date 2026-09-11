{% macro default_unknown(column_name) %}
    coalesce(
        nullif(trim(cast({{ column_name }} as string)), ''),
        'UNKNOWN'
    )
{% endmacro %}