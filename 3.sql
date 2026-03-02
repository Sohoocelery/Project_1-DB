-- Query 3: Students Who RSVPd to Academic Events (Nested Subquery)
-- Purpose: Finds all students who have RSVPd to any event categorized as
-- 'academic'. Uses two levels of nested IN subqueries — first finding
-- academic event IDs, then finding student IDs who RSVPd to those
-- events, then pulling the student name and email.

SELECT name, email
FROM Student
WHERE student_id IN (
    SELECT student_id FROM RSVP
    WHERE event_id IN (
        SELECT event_id FROM Event
        WHERE type = 'academic'
    )
);

-- Example Output:
-- name          | email
-- --------------|------------------------------------
-- Alice Johnson | alice.johnson@northeastern.edu
-- Bob Smith     | bob.smith@northeastern.edu
-- Frank Miller  | frank.miller@northeastern.edu
-- Henry Brown   | henry.brown@northeastern.edu
