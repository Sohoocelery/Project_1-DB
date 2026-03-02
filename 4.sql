-- Query 4: Freshman/Sophomore Non-Cancelled RSVPs for Large Events
-- Purpose: Returns students who are freshmen or sophomores, whose RSVP
-- status is not 'cancelled', and who RSVPd to events with capacity
-- greater than 50. Demonstrates compound WHERE conditions with OR,
-- !=, and > operators across a multi-table join.

SELECT s.name, s.year, s.major, r.status
FROM Student s
JOIN RSVP r ON s.student_id = r.student_id
JOIN Event e ON r.event_id = e.event_id
WHERE (s.year = 'freshman' OR s.year = 'sophomore')
AND r.status != 'cancelled'
AND e.capacity > 50;

-- Example Output:
-- name          | year      | major            | status
-- --------------|-----------|------------------|----------
-- Alice Johnson | freshman  | Computer Science | confirmed
-- Bob Smith     | sophomore | Business         | confirmed
-- Isla Martinez | freshman  | Nursing          | confirmed
-- Jake Taylor   | sophomore | Economics        | confirmed
