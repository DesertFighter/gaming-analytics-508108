{% macro null_if_empty(column_name) %}
    nullif(trim(cast({{ column_name }} as string)), '')
{% endmacro %}