-- Seed data for the users_programs table
-- Ensure the table is empty before seeding
TRUNCATE TABLE users_programs RESTART IDENTITY;
-- Insert seed data with user enrollment in programs
INSERT INTO users_programs (users_id, program_id, start_date, end_date)
VALUES (1, 1, '2024-01-01', '2024-03-26'),
  -- User 1 enrolled in Beginner Strength Program
  (2, 2, '2024-02-01', '2024-03-26'),
  -- User 2 enrolled in Intermediate Hypertrophy Program
  (3, 3, '2024-01-15', '2024-05-05'),
  -- User 3 enrolled in Advanced Powerlifting Program
  (1, 4, '2024-04-01', NULL);
-- User 1 enrolled in Custom Bodyweight Program
-- Verify the inserted data
SELECT *
FROM users_programs;
