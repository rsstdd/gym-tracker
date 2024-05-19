INSERT INTO workouts_exercises (
    workouts_id,
    exercise_id,
    sets,
    reps,
    weight,
    rir,
    exertion_metric
  )
VALUES -- Workout A for program 1
  (1, 1, 5, 5, 100, 2, 'RPE 8'),
  (1, 2, 5, 5, 80, 2, 'RPE 8'),
  -- Workout B for program 1
  (2, 3, 5, 5, 120, 3, 'RPE 7'),
  (2, 4, 5, 5, 90, 3, 'RPE 7'),
  -- Workout A for program 1 (repeated)
  (3, 1, 5, 5, 105, 1, 'RPE 9'),
  (3, 2, 5, 5, 85, 1, 'RPE 9'),
  -- Workout B for program 2
  (4, 3, 5, 5, 125, 3, 'RPE 7'),
  (4, 4, 5, 5, 95, 3, 'RPE 7'),
  -- Workout A for program 2
  (5, 1, 5, 5, 110, 2, 'RPE 8'),
  (5, 2, 5, 5, 90, 2, 'RPE 8'),
  -- Workout B for program 2 (repeated)
  (6, 3, 5, 5, 130, 3, 'RPE 7'),
  (6, 4, 5, 5, 100, 3, 'RPE 7');
-- Verify the inserted data
SELECT *
FROM workouts;
SELECT *
FROM workouts_exercises;
