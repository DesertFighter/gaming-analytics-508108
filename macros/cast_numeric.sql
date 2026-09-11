{% macro cast_numeric(column_name) %}
    cast({{ column_name }} as numeric)
{% endmacro %}