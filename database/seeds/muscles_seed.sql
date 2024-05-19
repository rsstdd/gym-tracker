-- Seed data for the MuscleGroups table with specific muscles
-- Ensure the table is empty before seeding
TRUNCATE TABLE muscles RESTART IDENTITY;
-- Insert seed data with specific muscles
INSERT INTO muscles (name)
VALUES ('Pectoralis Major'),
  -- Chest
  ('Latissimus Dorsi'),
  -- Back
  ('Trapezius'),
  -- Upper Back
  ('Rhomboids'),
  -- Upper Back
  ('Deltoids'),
  -- Shoulders
  ('Biceps Brachii'),
  -- Arms
  ('Triceps Brachii'),
  -- Arms
  ('Brachialis'),
  -- Arms
  ('Rectus Abdominis'),
  -- Abs
  ('Obliques'),
  -- Abs
  ('Erector Spinae'),
  -- Lower Back
  ('Gluteus Maximus'),
  -- Glutes
  ('Quadriceps Femoris'),
  -- Quadriceps
  ('Hamstrings'),
  -- Hamstrings
  ('Gastrocnemius'),
  -- Calves
  ('Soleus'),
  -- Calves
  ('Adductors'),
  -- Inner Thigh
  ('Abductors'),
  -- Outer Thigh
  ('Serratus Anterior'),
  -- Chest
  ('Infraspinatus'),
  -- Upper Back
  ('Teres Major'),
  -- Upper Back
  ('Forearm Flexors'),
  -- Forearms
  ('Forearm Extensors');
-- Forearms
-- Verify the inserted data
SELECT *
FROM muscles;
