-- Seed data for the Users table
-- Ensure the table is empty before seeding
TRUNCATE TABLE users RESTART IDENTITY;
-- Insert seed data
INSERT INTO users (username, email, password_hash)
VALUES ('user1', 'user1@example.com', 'hashed_password1'),
  ('user2', 'user2@example.com', 'hashed_password2'),
  ('user3', 'user3@example.com', 'hashed_password3');
-- Verify the inserted data
SELECT *
FROM users;
