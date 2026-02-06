---event_clean

CREATE OR REPLACE VIEW `vaulted-epigram-475613-g4.raw_data.events_clean`
AS
SELECT DISTINCT
  user_id,
  event_id,
  CASE
    WHEN lower(event_name) IN ('Addtocart', 'add_to_cart') THEN 'add_to_cart'
    ELSE lower(event_name)
    END
    AS event_name,
  DATE(event_time) AS event_time,
FROM `vaulted-epigram-475613-g4.raw_data.users_event`
WHERE user_id NOT LIKE 'test' AND event_time IS NOT NULL;
