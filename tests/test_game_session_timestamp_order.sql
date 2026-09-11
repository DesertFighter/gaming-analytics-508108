-- TEST:
-- Session end timestamp must not be earlier than session start timestamp.
-- This query returns only invalid rows.
-- 0 rows = PASS
-- 1+ rows = FAIL

select
    sessionid,
    sessionstarttimestamp,
    sessionendtimestamp
from {{ ref('silver_game_sessions') }}
where sessionstarttimestamp is not null
  and sessionendtimestamp is not null
  and sessionendtimestamp < sessionstarttimestamp