-- Seed data for the progress_tracking table
-- Ensure the table is empty before seeding
TRUNCATE TABLE progress_tracking RESTART IDENTITY;
-- Insert seed data with progress tracking for each user
INSERT INTO progress_tracking (
    users_id,
    exercise_id,
    date,
    sets,
    reps,
    weight,
    rir,
    exertion_metric,
    notes
  )
VALUES -- User 1
  (
    1,
    5,
    '2024-01-03',
    3,
    5,
    100,
    2,
    'RPE 8',
    'Felt strong today'
  ),
  (
    1,
    9,
    '2024-01-03',
    3,
    5,
    50,
    2,
    'RPE 8',
    'Solid pull-ups'
  ),
  (
    1,
    10,
    '2024-01-03',
    3,
    8,
    50,
    2,
    'RPE 8',
    'Good dumbbell presses'
  ),
  -- User 2
  (
    2,
    10,
    '2024-02-03',
    4,
    12,
    40,
    3,
    'RPE 7',
    'Good pump'
  ),
  (
    2,
    11,
    '2024-02-03',
    4,
    12,
    30,
    3,
    'RPE 7',
    'Smooth reps'
  ),
  (
    2,
    19,
    '2024-02-03',
    4,
    12,
    50,
    3,
    'RPE 7',
    'Triceps burning'
  ),
  -- User 3
  (
    3,
    6,
    '2024-01-17',
    5,
    5,
    220,
    1,
    'RPE 9',
    'Heavy but manageable'
  ),
  (
    3,
    13,
    '2024-01-17',
    5,
    5,
    200,
    1,
    'RPE 9',
    'Feeling strong'
  ),
  (
    3,
    16,
    '2024-01-17',
    5,
    5,
    100,
    1,
    'RPE 9',
    'Legs burning'
  ),
  -- User 1, Custom Bodyweight Program
  (
    1,
    63,
    '2024-04-03',
    4,
    15,
    50,
    4,
    'RPE 6',
    'Easy day'
  ),
  (
    1,
    71,
    '2024-04-03',
    4,
    20,
    50,
    4,
    'RPE 6',
    'Good form'
  );
-- Verify the inserted data
SELECT *
FROM progress_tracking;
