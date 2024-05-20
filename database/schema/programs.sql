-- Create the Program table
DROP TABLE IF EXISTS programs CASCADE;
CREATE TABLE programs (
  id SERIAL PRIMARY KEY,
programs_name VARCHAR(255) NOT NULL,
programs_type VARCHAR(50) NOT NULL CHECK (
  programs_type IN ('Hypertrophy', 'Strength', 'Custom')
),
  description TEXT,
  duration_weeks INTEGER NOT NULL,
  -- Program duration in weeks
  created_by_user_id INTEGER REFERENCES users(id) -- NULL for predefined programs
);
