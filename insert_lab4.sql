-- Таблица Series
INSERT INTO Series (title, year_release, budget, annotation) VALUES 
('Breaking Bad', 2008, 3000000, 'Сериал о преподавателе химии, ставшем наркобароном.'),
('Game of Thrones', 2011, 10000000, 'Фэнтезийная драма о борьбе за Железный трон.'),
('Stranger Things', 2016, 5000000, 'История о сверхъестественных событиях в маленьком городе.'),
('The Witcher', 2019, 8000000, 'Фэнтезийный сериал о приключениях ведьмака Геральта.'),
('Sherlock', 2010, 2000000, 'Современная адаптация рассказов о Шерлоке Холмсе.'),
('Friends', 1994, 1000000, 'Комедийный сериал о жизни шестерых друзей в Нью-Йорке.');

-- Таблица Season
INSERT INTO Season (id_series, season_number, year_release) VALUES 
(1, 1, 2008), (1, 2, 2009), (1, 3, 2010), (1, 4, 2011), (1, 5, 2012), -- Breaking Bad: 5 сезонов
(2, 1, 2011), (2, 2, 2012), (2, 3, 2013), (2, 4, 2014), (2, 5, 2015), (2, 6, 2016), (2, 7, 2017), (2, 8, 2019), -- Game of Thrones: 8 сезонов
(3, 1, 2016), (3, 2, 2017), (3, 3, 2019), (3, 4, 2022), -- Stranger Things: 4 сезона
(4, 1, 2019), (4, 2, 2021), -- The Witcher: 2 сезона
(5, 1, 2010), (5, 2, 2012), (5, 3, 2014), (5, 4, 2017), -- Sherlock: 4 сезона
(6, 1, 1994), (6, 2, 1995), (6, 3, 1996), (6, 4, 1997), (6, 5, 1998), (6, 6, 1999), (6, 7, 2000), (6, 8, 2001), (6, 9, 2002), (6, 10, 2003); -- Friends: 10 сезонов

-- Таблица Episode
INSERT INTO Episode (id_season, episode_number, title, air_date, description) VALUES 
-- Breaking Bad, сезон 1 (id_season=1)
(1, 1, 'Pilot', '2008-01-20', 'Первый эпизод, знакомящий с главным героем.'),
(1, 2, 'Cat''s in the Bag...', '2008-01-27', 'Начало криминальной драмы.'),
(1, 3, 'And the Bag''s in the River', '2008-02-10', 'Продолжение истории.'),
-- Game of Thrones, сезон 1 (id_season=6)
(6, 1, 'Winter Is Coming', '2011-04-17', 'Знакомство с миром Вестероса.'),
(6, 2, 'The Kingsroad', '2011-04-24', 'Путешествие на север.'),
(6, 3, 'Lord Snow', '2011-05-01', 'Прибытие в Королевскую Гавань.'),
-- Stranger Things, сезон 1 (id_season=14)
(14, 1, 'Chapter One: The Vanishing of Will Byers', '2016-07-15', 'Исчезновение мальчика в маленьком городе.'),
(14, 2, 'Chapter Two: The Weirdo on Maple Street', '2016-07-15', 'Знакомство с Одиннадцать.'),
(14, 3, 'Chapter Three: Holly, Jolly', '2016-07-15', 'Поиск Уилла продолжается.'),
-- The Witcher, сезон 1 (id_season=18)
(18, 1, 'The End''s Beginning', '2019-12-20', 'Ведьмак Геральт встречает Ренфри.'),
(18, 2, 'Four Marks', '2019-12-20', 'Йеннифэр начинает свое обучение.'),
(18, 3, 'Betrayer Moon', '2019-12-20', 'Геральт охотится на монстра.'),
-- Sherlock, сезон 1 (id_season=20)
(20, 1, 'A Study in Pink', '2010-07-25', 'Шерлок встречает Джона Ватсона.'),
(20, 2, 'The Blind Banker', '2010-08-01', 'Расследование банковского дела.'),
(20, 3, 'The Great Game', '2010-08-08', 'Шерлок против Мориарти.'),
-- Friends, сезон 1 (id_season=24)
(24, 1, 'The One Where Monica Gets a Roommate', '1994-09-22', 'Рэйчел приезжает в Нью-Йорк.'),
(24, 2, 'The One with the Sonogram at the End', '1994-09-29', 'Росс узнает о беременности Кэрол.'),
(24, 3, 'The One with the Thumb', '1994-10-06', 'Моника встречается с парнем.');

-- Таблица Actor
INSERT INTO Actor (name, birth_date) VALUES 
('Bryan Cranston', '1956-03-07'),
('Emilia Clarke', '1986-10-23'),
('Millie Bobby Brown', '2004-02-19'),
('Henry Cavill', '1983-05-05'),
('Benedict Cumberbatch', '1976-07-19'),
('Jennifer Aniston', '1969-02-11'),
('Courteney Cox', '1964-06-15'),
('David Schwimmer', '1966-11-02');

-- Таблица SeriesActor
INSERT INTO SeriesActor (id_series, id_actor, role) VALUES 
(1, 1, 'Главный'),        -- Bryan Cranston в "Breaking Bad"
(2, 2, 'Главная'),        -- Emilia Clarke в "Game of Thrones"
(3, 3, 'Главная'),        -- Millie Bobby Brown в "Stranger Things"
(4, 4, 'Главный'),        -- Henry Cavill в "The Witcher"
(5, 5, 'Главный'),        -- Benedict Cumberbatch в "Sherlock"
(6, 6, 'Главная'),        -- Jennifer Aniston в "Friends"
(6, 7, 'Главная'),        -- Courteney Cox в "Friends"
(6, 8, 'Главный'),        -- David Schwimmer в "Friends"
(1, 2, 'Второстепенная'), -- Emilia Clarke в "Breaking Bad"
(3, 1, 'Второстепенная'), -- Bryan Cranston в "Stranger Things"
(4, 5, 'Второстепенная'), -- Benedict Cumberbatch в "The Witcher"
(5, 4, 'Второстепенная'); -- Henry Cavill в "Sherlock"

-- Таблица Review
INSERT INTO Review (id_series, critic_name, rating, review_text, review_date) VALUES 
(1, 'Critic A', 9, 'Отличный сюжет и развитие персонажей.', '2008-02-01'),
(1, 'Critic B', 8, 'Хорошая игра актеров, но немного затянуто.', '2009-03-15'),
(2, 'Critic C', 10, 'Эпическое фэнтези с потрясающими визуальными эффектами.', '2011-05-01'),
(2, 'Critic D', 7, 'Слишком много персонажей, сложно уследить.', '2012-06-20'),
(3, 'Critic E', 8, 'Захватывающая атмосфера и интересные персонажи.', '2016-08-01'),
(3, 'Critic F', 6, 'Неплохое начало, но сюжет предсказуем.', '2017-09-10'),
(4, 'Critic G', 9, 'Отличная адаптация книг, Хенри Кавилл великолепен.', '2019-12-25'),
(4, 'Critic H', 8, 'Визуально впечатляет, но сюжет иногда теряется.', '2020-12-25'),
(5, 'Critic I', 10, 'Бенедикт Камбербэтч идеально вписался в роль Шерлока.', '2010-08-01'),
(5, 'Critic J', 9, 'Умный и остроумный сериал.', '2011-08-15'),
(6, 'Critic K', 7, 'Классический ситком с забавными моментами.', '1994-10-01'),
(6, 'Critic L', 8, 'Отличная химия между актерами.', '1995-11-01');
