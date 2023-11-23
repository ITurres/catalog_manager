CREATE DATABASE catalog_manager;

-- ? Genre Table here
--!=>
-- ? Author Table here
--!=>
CREATE TABLE 
    label (
        id UUID PRIMARY KEY,
        title VARCHAR(200),
        color VARCHAR(100)
    );
--!=>
CREATE TABLE
    book (
        id UUID PRIMARY KEY,
        title VARCHAR(200),
        genre_id INT NOT NULL REFERENCES genre (id),
        author_id INT NOT NULL REFERENCES author (id),
        label_id INT NOT NULL REFERENCES label (id),
        publish_date DATE,
        archived BOOLEAN NOT NULL DEFAULT FALSE,
        publisher VARCHAR(200),
        cover_state VARCHAR(10)
    );
--!=>
-- ? MusicAlbum Table here
--!=>
-- *
CREATE TABLE
    game (
        id UUID PRIMARY KEY,
        title VARCHAR(200),
        genre_id INT NOT NULL REFERENCES genre (id),
        author_id INT NOT NULL REFERENCES author (id),
        label_id INT NOT NULL REFERENCES label (id),
        publish_date DATE,
        archived BOOLEAN NOT NULL DEFAULT FALSE,
        multiplayer BOOLEAN NOT NULL DEFAULT FALSE,
        last_played_at DATE
    );