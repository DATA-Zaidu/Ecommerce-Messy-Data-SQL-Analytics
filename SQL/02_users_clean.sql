---users-clean
    
    CREATE OR REPLACE VIEW `vaulted-epigram-475613-g4.raw_data.users_clean` AS
WITH ranked_users AS (
  SELECT
    user_id,

    LOWER(TRIM(city)) AS city,
    LOWER(device) AS device,

    -- ✅ multi-format safe date parsing
    COALESCE(
      SAFE.PARSE_DATE('%Y-%m-%d', signup_date),   -- 2024-01-01
      SAFE.PARSE_DATE('%d-%m-%Y', signup_date),   -- 01-01-2024
      SAFE.PARSE_DATE('%Y/%m/%d', signup_date),   -- 2024/01/01
      SAFE.PARSE_DATE('%m/%d/%Y', signup_date)    -- 01/01/2024
    ) AS signup_date,

    ROW_NUMBER() OVER (
      PARTITION BY user_id
      ORDER BY created_at DESC
    ) AS rn

  FROM `vaulted-epigram-475613-g4.raw_data.users`
  WHERE is_test_user <> TRUE
)

SELECT
  user_id,
  city,
  device,
  signup_date
FROM ranked_users
WHERE rn = 1;

