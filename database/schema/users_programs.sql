-- Create the UserProgram table
CREATE TABLE users_programs (
  users_id INTEGER NOT NULL,
  program_id INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  PRIMARY KEY (users_id, program_id),
  FOREIGN KEY (users_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (program_id) REFERENCES programs(id) ON DELETE CASCADE
);
