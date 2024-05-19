-- Create the ProgressTracking table
CREATE TABLE progress_tracking (
  id SERIAL PRIMARY KEY,
  users_id INTEGER NOT NULL REFERENCES users(id),
  exercise_id INTEGER NOT NULL REFERENCES exercises(id),
  date DATE NOT NULL,
  sets INTEGER NOT NULL,
  reps INTEGER NOT NULL,
  weight FLOAT NOT NULL,
  rir INTEGER,
  -- Reps in Reserve
  exertion_metric VARCHAR(50),
  -- Additional exertion metric
  notes TEXT
);
