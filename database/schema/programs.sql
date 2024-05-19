-- Create the Program table
CREATE TABLE programs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(50) NOT NULL CHECK (type IN ('Hypertrophy', 'Strength', 'Custom')),
  description TEXT,
  duration_weeks INTEGER NOT NULL,
  -- Program duration in weeks
  created_by_user_id INTEGER REFERENCES users(id) -- NULL for predefined programs
);
