WITH EpisodeStats AS (
    SELECT 
        s.id_series,
        s.title AS series_title,
        COUNT(e.id_episode) AS episode_count
    FROM 
        Series s
    JOIN 
        Season se ON s.id_series = se.id_series
    JOIN 
        Episode e ON se.id_season = e.id_season
    WHERE 
        e.air_date IS NOT NULL
    GROUP BY 
        s.id_series, s.title
),
ActorRoles AS (
    SELECT 
        a.id_actor,
        a.name AS actor_name,
        COUNT(DISTINCT sa.id_series) AS series_count,
        STRING_AGG(
            CASE 
                WHEN sa.role = 'Главный' THEN s.title 
                ELSE NULL 
            END, 
            ', ' ORDER BY s.year_release DESC
        ) AS main_roles,
        EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM a.birth_date::date) AS actor_age
    FROM 
        Actor a
    JOIN 
        SeriesActor sa ON a.id_actor = sa.id_actor
    JOIN 
        Series s ON sa.id_series = s.id_series
    GROUP BY 
        a.id_actor, a.name, a.birth_date
),
ReviewStats AS (
    SELECT 
        s.id_series,
        AVG(r.rating) AS avg_rating,
        COUNT(r.id_review) AS review_count,
        MAX(r.rating) AS max_rating,
        MIN(r.rating) AS min_rating
    FROM 
        Series s
    JOIN 
        Review r ON s.id_series = r.id_series
    GROUP BY 
        s.id_series
)
SELECT 
    es.series_title,
    es.episode_count,
    STRING_AGG(DISTINCT ar.actor_name, ', ' ORDER BY ar.actor_name) AS actors,
    COUNT(DISTINCT ar.id_actor) AS unique_actors,
    MAX(ar.actor_age) AS oldest_actor_age,
    MIN(ar.actor_age) AS youngest_actor_age,
    rs.avg_rating,
    rs.review_count,
    rs.max_rating,
    rs.min_rating,
    (
        SELECT COUNT(*) 
        FROM Season 
        WHERE id_series = es.id_series
    ) AS season_count,
    (
        SELECT STRING_AGG(a2.name, ', ' ORDER BY a2.name)
        FROM Actor a2
        JOIN SeriesActor sa2 ON a2.id_actor = sa2.id_actor
        WHERE sa2.id_series = es.id_series AND sa2.role = 'Главный'
    ) AS main_cast_members,
    CASE 
        WHEN rs.avg_rating > 8 THEN 'Высокая оценка'
        WHEN rs.avg_rating > 6 THEN 'Средняя оценка'
        ELSE 'Низкая оценка'
    END AS rating_category
FROM 
    EpisodeStats es
JOIN 
    ReviewStats rs ON es.id_series = rs.id_series
JOIN 
    SeriesActor sa ON es.id_series = sa.id_series
JOIN 
    ActorRoles ar ON sa.id_actor = ar.id_actor
GROUP BY 
    es.series_title, es.episode_count,
    rs.avg_rating, rs.review_count, rs.max_rating, rs.min_rating, es.id_series
ORDER BY 
    rs.avg_rating DESC, es.episode_count DESC;
