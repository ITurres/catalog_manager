CREATE DATABASE catalog_manager;

CREATE TABLE
    genre (id UUID PRIMARY KEY, name VARCHAR(50));

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
        genre_id UUID NOT NULL REFERENCES genre (id),
        author_id UUID NOT NULL REFERENCES author (id),
        label_id UUID NOT NULL REFERENCES label (id),
        publish_date DATE DEFAULT NULL,
        archived BOOLEAN NOT NULL DEFAULT FALSE,
        publisher VARCHAR(200),
        cover_state VARCHAR(10)
    );

--!=>
CREATE TABLE
    music_album (
        id UUID PRIMARY KEY,
        title VARCHAR(200),
        genre_id UUID NOT NULL REFERENCES genre (id),
        author_id UUID NOT NULL REFERENCES author (id),
        label_id UUID NOT NULL REFERENCES label (id),
        publish_date DATE DEFAULT NULL,
        archived BOOLEAN NOT NULL DEFAULT FALSE,
        on_spotify BOOLEAN NOT NULL DEFAULT FALSE,
    );

--!=>
-- *
CREATE TABLE
    game (
        id UUID PRIMARY KEY,
        title VARCHAR(200),
        genre_id UUID NOT NULL REFERENCES genre (id),
        author_id UUID NOT NULL REFERENCES author (id),
        label_id UUID NOT NULL REFERENCES label (id),
        publish_date DATE DEFAULT NULL,
        archived BOOLEAN NOT NULL DEFAULT FALSE,
        multiplayer BOOLEAN NOT NULL DEFAULT FALSE,
        last_played_at DATE DEFAULT NULL
    );