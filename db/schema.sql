CREATE DATABASE catalog_manager;

-- ? Genre Table here
--!=>
-- ? Author Table here
--!=>
-- ? Label Table here
--!=>
-- ? Book Table here
--!=>
-- ? MusicAlbum Table here
--!=>
-- *
CREATE TABLE
    game (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        genre_id INT NOT NULL REFERENCES genre (id),
        author_id INT NOT NULL REFERENCES author (id),
        label_id INT NOT NULL REFERENCES label (id),
        publish_date DATE,
        archived BOOLEAN NOT NULL DEFAULT FALSE,
        multiplayer BOOLEAN NOT NULL DEFAULT FALSE,
        last_played_at DATE
    );