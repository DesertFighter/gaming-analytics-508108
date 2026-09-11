{% macro trim_column(column_name) %}
    trim(cast({{ column_name }} as string))
{% endmacro %}