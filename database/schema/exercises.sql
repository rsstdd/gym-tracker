-- Create the Exercise table
CREATE TABLE exercises (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  equipment VARCHAR(255),
  difficulty_level VARCHAR(50)
);
