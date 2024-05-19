-- Seed data for the exercise_sessions table
-- Ensure the table is empty before seeding
TRUNCATE TABLE exercises_sessions RESTART IDENTITY;
-- Insert seed data with exercise sessions for users
INSERT INTO exercises_sessions (users_id, program_id, split_id, date)
VALUES (1, 1, 1, '2024-01-03'),
  -- User 1, Beginner Strength Program, Day 1
  (2, 2, 4, '2024-02-03'),
  -- User 2, Intermediate Hypertrophy Program, Day 1
  (3, 3, 7, '2024-01-17'),
  -- User 3, Advanced Powerlifting Program, Day 1
  (1, 4, 10, '2024-04-03');
-- User 1, Custom Bodyweight Program, Day 1
-- Verify the inserted data
SELECT *
FROM exercises_sessions;
