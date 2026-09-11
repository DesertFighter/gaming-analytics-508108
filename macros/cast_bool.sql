{% macro cast_bool(column_name) %}
    cast({{ column_name }} as bool)
{% endmacro %}