pub const first_upgrade_sql = "
  CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  valid_tokens TEXT[],  -- array of text strings
  secret_keys TEXT[],   -- array of text strings
  is_superuser BOOLEAN NOT NULL DEFAULT false,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
"

pub const first_downgrade_sql = "DROP TABLE IF EXISTS users CASCADE;"
