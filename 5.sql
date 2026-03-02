-- Query 5: Event Interest Level Classification (CASE Statement)
-- Purpose: Classifies each event's popularity into an interest level based
-- on total RSVP count using a CASE expression. Uses a LEFT JOIN so
-- events with zero RSVPs still appear. Categories are:
-- "No RSVPs" (0), "Low Interest" (<5), "Moderate Interest" (<10),
-- and "High Interest" (10+).

SELECT
    e.title,
    e.capacity,
    COUNT(r.rsvp_id) AS total_rsvps,
    CASE
        WHEN COUNT(r.rsvp_id) = 0 THEN 'No RSVPs'
        WHEN COUNT(r.rsvp_id) < 5 THEN 'Low Interest'
        WHEN COUNT(r.rsvp_id) < 10 THEN 'Moderate Interest'
        ELSE 'High Interest'
    END AS interest_level
FROM Event e
LEFT JOIN RSVP r ON e.event_id = r.event_id
GROUP BY e.event_id, e.title, e.capacity;

-- Example Output:
-- title                       | capacity | total_rsvps | interest_level
-- ----------------------------|----------|-------------|----------------
-- Hackathon 2025              | 100      | 4           | Low Interest
-- International Food Festival | 200      | 4           | Low Interest
-- Spring Soccer Tournament    | 60       | 2           | Low Interest
-- Community Clean Up Day      | 50       | 2           | Low Interest
-- Finance Networking Night    | 80       | 2           | Low Interest
-- Spring Dance Showcase       | 300      | 2           | Low Interest
-- Debate Championships        | 75       | 2           | Low Interest
-- Earth Day Festival          | 150      | 2           | Low Interest
