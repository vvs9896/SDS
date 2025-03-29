-- 1. Полная выборка данных о сериалах
SELECT * FROM Series;

-- 2. Сериалы, выпущенные после 2010 года
SELECT title, year_release FROM Series WHERE year_release > 2010;

-- 3. Сортировка сериалов по году выпуска (от новейших)
SELECT title, year_release FROM Series ORDER BY year_release DESC;

-- 4. Пример арифметической операции с псевдонимом
SELECT season_number, (year_release + 1) AS next_year FROM Season;

-- 5. Средний рейтинг сериалов по рецензиям
SELECT s.title, AVG(r.rating) AS avg_rating 
FROM Series s 
JOIN Review r ON s.id_series = r.id_series 
GROUP BY s.title;

-- 6. Уникальные имена критиков
SELECT DISTINCT critic_name FROM Review;

-- 7. Объединение таблиц для получения информации об актёрах и их ролях
SELECT s.title, a.name, sa.role 
FROM Series s 
JOIN SeriesActor sa ON s.id_series = sa.id_series 
JOIN Actor a ON sa.id_actor = a.id_actor;

-- 8. Псевдо-выборка для вычисления арифметического выражения
SELECT (3 + 5) AS result;