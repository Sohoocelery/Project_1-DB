-- Query 2: Confirmed RSVPs with Student, Event, and Club Details
-- Purpose: Shows which students have confirmed RSVPs, along with the event
-- title and the club that hosted it. Performs a 3-way join across
-- RSVP -> Student, RSVP -> Event, and Event -> Club, then filters
-- to only 'confirmed' RSVPs.

SELECT s.name AS student_name, e.title AS event_title, c.name AS club_name, r.status
FROM RSVP r
JOIN Student s ON r.student_id = s.student_id
JOIN Event e ON r.event_id = e.event_id
JOIN Club c ON e.club_id = c.club_id
WHERE r.status = 'confirmed';

-- Example Output:
-- student_name   | event_title                 | club_name             | status
-- ---------------|-----------------------------|-----------------------|----------
-- Alice Johnson  | Hackathon 2025              | Computer Science Club | confirmed
-- Bob Smith      | Hackathon 2025              | Computer Science Club | confirmed
-- Carol White    | International Food Festival | Cultural Fusion       | confirmed
-- Emma Davis     | Community Clean Up Day      | Community Helpers     | confirmed
-- Grace Wilson   | Spring Dance Showcase       | Dance Collective      | confirmed
-- Isla Martinez  | Earth Day Festival          | Green Campus          | confirmed
-- Jake Taylor    | International Food Festival | Cultural Fusion       | confirmed
