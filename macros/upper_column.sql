{% macro upper_column(column_name) %}
    upper({{ column_name }})
{% endmacro %}