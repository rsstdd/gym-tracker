SELECT p.id,
  p.name,
  p.description
FROM programs p
  JOIN users_programs up ON p.id = up.program_id
WHERE up.users_id = 1
  AND up.end_date IS NULL;
