-- Seed data for the programs_exercises table
-- Ensure the table is empty before seeding
TRUNCATE TABLE programs_exercises RESTART IDENTITY;
-- Insert seed data with exercises for each split/session
INSERT INTO programs_exercises (split_id, exercise_id, sets, reps)
VALUES -- Beginner Strength Program (program_id 1)
  -- Day 1 - Upper Body
  (1, 5, 3, 5),
  -- Bench Press
  (1, 9, 3, 5),
  -- Pull-Up
  (1, 10, 3, 8),
  -- Dumbbell Bench Press
  -- Day 2 - Lower Body
  (2, 6, 3, 5),
  -- Squat
  (2, 7, 3, 5),
  -- Deadlift
  (2, 13, 3, 8),
  -- Leg Press
  -- Day 3 - Full Body
  (3, 5, 3, 5),
  -- Bench Press
  (3, 6, 3, 5),
  -- Squat
  (3, 7, 3, 5),
  -- Deadlift
  -- Intermediate Hypertrophy Program (program_id 2)
  -- Day 1 - Chest and Triceps
  (4, 10, 4, 12),
  -- Dumbbell Bench Press
  (4, 11, 4, 12),
  -- Incline Bench Press
  (4, 19, 4, 12),
  -- Tricep Dip
  -- Day 2 - Back and Biceps
  (5, 14, 4, 12),
  -- Lat Pulldown
  (5, 15, 4, 12),
  -- Seated Row
  (5, 18, 4, 12),
  -- Bicep Curl
  -- Day 3 - Legs and Shoulders
  (6, 6, 4, 12),
  -- Squat
  (6, 13, 4, 12),
  -- Leg Press
  (6, 8, 4, 12),
  -- Shoulder Press
  -- Advanced Powerlifting Program (program_id 3)
  -- Day 1 - Squat Focus
  (7, 6, 5, 5),
  -- Squat
  (7, 13, 5, 5),
  -- Leg Press
  (7, 16, 5, 5),
  -- Leg Curl
  -- Day 2 - Bench Press Focus
  (8, 5, 5, 5),
  -- Bench Press
  (8, 10, 5, 5),
  -- Dumbbell Bench Press
  (8, 17, 5, 5),
  -- Tricep Extension
  -- Day 3 - Deadlift Focus
  (9, 7, 5, 5),
  -- Deadlift
  (9, 12, 5, 5),
  -- Hip Thrust
  (9, 15, 5, 5),
  -- Seated Row
  -- Custom Bodyweight Program (program_id 4)
  -- Day 1 - Upper Body
  (10, 63, 4, 15),
  -- Push-Up
  (10, 71, 4, 20),
  -- Bodyweight Row
  -- Day 2 - Lower Body
  (11, 70, 4, 20),
  -- Bodyweight Squat
  (11, 73, 4, 20),
  -- Lunge
  -- Day 3 - Core
  (12, 39, 4, 15),
  -- Plank
  (12, 42, 4, 20);
-- Mountain Climber
-- Verify the inserted data
SELECT *
FROM programs_exercises;
