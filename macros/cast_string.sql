{% macro cast_string(column_name) %}
    cast({{ column_name }} as string)
{% endmacro %}