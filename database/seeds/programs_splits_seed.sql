TRUNCATE TABLE workouts,
programs_exercises,
programs_splits,
workouts_exercises RESTART IDENTITY;
INSERT INTO programs_splits (programs_id, programs_name, day_of_week)
VALUES -- Beginner Strength Program (program_id 1)
  (1, 'Day 1 - Upper Body', 1),
  (1, 'Day 2 - Lower Body', 3),
  (1, 'Day 3 - Full Body', 5),
  -- Intermediate Hypertrophy Program (program_id 2)
  (2, 'Day 1 - Chest and Triceps', 1),
  (2, 'Day 2 - Back and Biceps', 3),
  (2, 'Day 3 - Legs and Shoulders', 5),
  -- Advanced Powerlifting Program (program_id 3)
  (3, 'Day 1 - Squat Focus', 1),
  (3, 'Day 2 - Bench Press Focus', 3),
  (3, 'Day 3 - Deadlift Focus', 5),
  -- Custom Bodyweight Program (program_id 4)
  (4, 'Day 1 - Upper Body', 2),
  (4, 'Day 2 - Lower Body', 4),
  (4, 'Day 3 - Core', 6);
-- Verify the inserted data
SELECT *
FROM programs_splits;
