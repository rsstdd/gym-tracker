-- Create the ProgramSplit table
-- Drop programs_split table
DROP TABLE IF EXISTS programs_split CASCADE;
CREATE TABLE programs_split (
  id SERIAL PRIMARY KEY,
  programs_id INTEGER NOT NULL REFERENCES programs(id),
  name VARCHAR(255) NOT NULL,
  -- Name or description of the split/session
  day_of_week INTEGER NOT NULL CHECK (
    day_of_week BETWEEN 1 AND 7
  ) -- Day of the week (1 = Monday, 7 = Sunday)
);
