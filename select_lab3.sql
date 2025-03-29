-- Запрос 1: Сериалы со средним рейтингом выше 8
SELECT 
    s.title, 
    AVG(r.rating) AS avg_rating
FROM 
    Series s
JOIN 
    Review r ON s.id_series = r.id_series
GROUP BY 
    s.title
HAVING 
    AVG(r.rating) > 8;

-- Запрос 2: Актеры, участвовавшие в более чем одном сериале
SELECT 
    a.name, 
    COUNT(sa.id_series) AS series_count
FROM 
    Actor a
JOIN 
    SeriesActor sa ON a.id_actor = sa.id_actor
GROUP BY 
    a.name
HAVING 
    COUNT(sa.id_series) > 1;

-- Запрос 3: Сериал с наибольшим количеством сезонов
SELECT 
    s.title, 
    COUNT(se.id_season) AS season_count
FROM 
    Series s
JOIN 
    Season se ON s.id_series = se.id_series
GROUP BY 
    s.title
ORDER BY 
    season_count DESC
LIMIT 1;

-- Запрос 4: Скользящее среднее рейтинга сериалов по годам
SELECT 
    s.title,
    s.year_release,
    r.rating,
    AVG(r.rating) OVER (ORDER BY s.year_release ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_rating
FROM 
    Series s
JOIN 
    Review r ON s.id_series = r.id_series
ORDER BY 
    s.year_release;

-- Запрос 5: Актер с наибольшим количеством главных ролей
SELECT 
    a.name, 
    COUNT(sa.role) AS main_role_count
FROM 
    Actor a
JOIN 
    SeriesActor sa ON a.id_actor = sa.id_actor
WHERE 
    sa.role = 'Главный'
GROUP BY 
    a.name
ORDER BY 
    main_role_count DESC
LIMIT 1;

-- Запрос 6: Сериалы с бюджетами выше среднего бюджета всех сериалов
SELECT 
    title, 
    budget
FROM 
    Series
WHERE 
    budget > (SELECT AVG(budget) FROM Series);

-- Запрос 7: Сериалы, где хотя бы один актер сыграл главную роль в другом сериале
SELECT DISTINCT 
    s1.title AS series_title,
    a.name AS actor_name,
    s2.title AS other_series_title
FROM 
    Series s1
JOIN 
    SeriesActor sa1 ON s1.id_series = sa1.id_series
JOIN 
    Actor a ON sa1.id_actor = a.id_actor
JOIN 
    SeriesActor sa2 ON a.id_actor = sa2.id_actor AND sa2.role = 'Главный'
JOIN 
    Series s2 ON sa2.id_series = s2.id_series
WHERE 
    s1.id_series != s2.id_series
ORDER BY 
    s1.title;

-- Запрос 8: Сериал с наибольшим количеством эпизодов
WITH episode_counts AS (
    SELECT 
        s.title, 
        COUNT(e.id_episode) AS episode_count
    FROM 
        Series s
    JOIN 
        Season se ON s.id_series = se.id_series
    JOIN 
        Episode e ON se.id_season = e.id_season
    GROUP BY 
        s.title
)
SELECT 
    title, 
    episode_count
FROM 
    episode_counts
ORDER BY 
    episode_count DESC
LIMIT 1;

-- Запрос 9: Актеры, родившиеся после 1980 года и участвовавшие в сериалах после 2010 года
SELECT DISTINCT 
    a.name
FROM 
    Actor a
JOIN 
    SeriesActor sa ON a.id_actor = sa.id_actor
JOIN 
    Series s ON sa.id_series = s.id_series
WHERE 
    a.birth_date > '1980-01-01' 
    AND s.year_release > 2010;

-- Запрос 10: Сериал с наибольшим разрывом между годом выпуска первого и последнего сезона
SELECT 
    s.title,
    MAX(se.year_release) - MIN(se.year_release) AS year_gap
FROM 
    Series s
JOIN 
    Season se ON s.id_series = se.id_series
GROUP BY 
    s.title
ORDER BY 
    year_gap DESC
LIMIT 1;