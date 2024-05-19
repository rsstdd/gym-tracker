-- Create workouts table
CREATE TABLE workouts (
  id SERIAL PRIMARY KEY,
  program_id INT NOT NULL,
  session_date DATE,
  session_name VARCHAR(255),
  FOREIGN KEY (program_id) REFERENCES programs(id) ON DELETE CASCADE
);
