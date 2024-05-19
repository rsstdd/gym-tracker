-- Ensure the tables are empty before seeding
TRUNCATE TABLE workouts_exercises,
workouts RESTART IDENTITY;
-- Insert seed data for the workouts table
INSERT INTO workouts (program_id, session_date, session_name)
VALUES (1, '2023-01-01', 'Workout A'),
  (1, '2023-01-03', 'Workout B'),
  (1, '2023-01-05', 'Workout A'),
  (2, '2023-01-02', 'Workout B'),
  (2, '2023-01-04', 'Workout A'),
  (2, '2023-01-06', 'Workout B');
