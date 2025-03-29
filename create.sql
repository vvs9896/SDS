-- Таблица Series
CREATE TABLE Series (
    id_series INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    year_release INTEGER CHECK (year_release BETWEEN 1900 AND 2025),
    budget REAL DEFAULT 0,
    annotation TEXT
);

-- Таблица Season
CREATE TABLE Season (
    id_season INTEGER PRIMARY KEY AUTOINCREMENT,
    id_series INTEGER NOT NULL,
    season_number INTEGER NOT NULL,
    year_release INTEGER CHECK (year_release BETWEEN 1900 AND 2025),
    FOREIGN KEY (id_series) REFERENCES Series(id_series) ON DELETE CASCADE
);

-- Таблица Episode
CREATE TABLE Episode (
    id_episode INTEGER PRIMARY KEY AUTOINCREMENT,
    id_season INTEGER NOT NULL,
    episode_number INTEGER NOT NULL,
    title TEXT NOT NULL,
    air_date DATE,
    description TEXT,
    FOREIGN KEY (id_season) REFERENCES Season(id_season) ON DELETE CASCADE
);

-- Таблица Actor
CREATE TABLE Actor (
    id_actor INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    birth_date DATE
);

-- Таблица SeriesActor (связующая таблица)
CREATE TABLE SeriesActor (
    id_series INTEGER NOT NULL,
    id_actor INTEGER NOT NULL,
    role TEXT,
    PRIMARY KEY (id_series, id_actor),
    FOREIGN KEY (id_series) REFERENCES Series(id_series) ON DELETE CASCADE,
    FOREIGN KEY (id_actor) REFERENCES Actor(id_actor) ON DELETE CASCADE
);

-- Таблица Review
CREATE TABLE Review (
    id_review INTEGER PRIMARY KEY AUTOINCREMENT,
    id_series INTEGER NOT NULL,
    critic_name TEXT NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 10),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (id_series) REFERENCES Series(id_series) ON DELETE CASCADE
);
