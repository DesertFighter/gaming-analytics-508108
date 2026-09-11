{% test non_negative(model, column_name) %}

    -- TEST:
    -- Ensures numeric values are never negative.
    -- 0 invalid rows = PASS
    -- 1+ invalid rows = FAIL

    select *
    from {{ model }}
    where {{ column_name }} < 0

{% endtest %}