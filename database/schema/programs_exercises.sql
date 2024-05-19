-- Create the ProgramExercise table
CREATE TABLE programs_exercises (
  id SERIAL PRIMARY KEY,
  split_id INTEGER NOT NULL REFERENCES programs_split(id),
  exercise_id INTEGER NOT NULL REFERENCES exercises(id),
  sets INTEGER NOT NULL,
  reps INTEGER NOT NULL
);
