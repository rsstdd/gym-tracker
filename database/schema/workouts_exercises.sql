-- Create the workouts_exercises table
CREATE TABLE workouts_exercises (
  id SERIAL PRIMARY KEY,
  workouts_id INTEGER NOT NULL REFERENCES workouts(id),
  exercise_id INTEGER NOT NULL REFERENCES exercises(id),
  sets INTEGER NOT NULL,
  reps INTEGER NOT NULL,
  weight FLOAT NOT NULL,
  rir INTEGER,
  -- Reps in Reserve
  exertion_metric VARCHAR(50) -- Additional exertion metric
);
