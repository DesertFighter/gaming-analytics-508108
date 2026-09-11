{% macro lower_column(column_name) %}
    lower({{ column_name }})
{% endmacro %}