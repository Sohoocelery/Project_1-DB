-- Query 1: Club Event Counts
-- Purpose: Lists every club along with how many events it has hosted.
-- Only includes clubs that have at least one event (via HAVING COUNT > 0).
-- Uses an INNER JOIN between Club and Event, then groups by club.

SELECT c.name AS club_name, COUNT(e.event_id) AS total_events
FROM Club c
JOIN Event e ON c.club_id = e.club_id
GROUP BY c.club_id, c.name
HAVING COUNT(e.event_id) > 0;

-- Example Output:
-- club_name              | total_events
-- -----------------------|-------------
-- Computer Science Club  | 2
-- Cultural Fusion        | 2
-- Intramural Soccer      | 2
-- Community Helpers      | 2
-- Finance Society        | 2
-- Dance Collective       | 2
-- Debate Team            | 2
-- Green Campus           | 2
