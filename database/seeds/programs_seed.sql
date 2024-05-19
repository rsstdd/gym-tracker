-- Seed data for the programs table
-- Ensure the table is empty before seeding
TRUNCATE TABLE programs RESTART IDENTITY;
-- Insert seed data with predefined and custom programs
INSERT INTO programs (
    name,
    type,
    description,
    duration_weeks,
    created_by_user_id
  )
VALUES (
    'Beginner Strength Program',
    'Strength',
    'A basic strength training program for beginners.',
    12,
    NULL
  ),
  (
    'Intermediate Hypertrophy Program',
    'Hypertrophy',
    'An intermediate program focused on muscle growth.',
    8,
    NULL
  ),
  (
    'Advanced Powerlifting Program',
    'Strength',
    'An advanced program for powerlifters.',
    16,
    NULL
  ),
  (
    'Custom Bodyweight Program',
    'Custom',
    'A custom program focused on bodyweight exercises.',
    10,
    1
  );
-- Assuming user_id 1 created this custom program
-- Verify the inserted data
SELECT *
FROM programs;
