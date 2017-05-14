-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- DROP DATABASE if exists tournament;
-- CREATE DATABASE tournament;


DROP TABLE IF EXISTS players CASCADE;
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);


DROP TABLE IF EXISTS matchups CASCADE;
CREATE TABLE matchups (
    winner INTEGER REFERENCES players (id),
    loser INTEGER REFERENCES players (id),
    PRIMARY KEY (winner, loser)
);


DROP VIEW IF EXISTS player_standings CASCADE;
CREATE VIEW player_standings AS
    SELECT
        players.id,
        players.name, 
        COALESCE(matches_played.wins, 0) AS wins, 
        COALESCE(matches_played.losses, 0) AS losses, 
        COALESCE(matches_played.total, 0) AS played
    FROM players
    LEFT JOIN (
        SELECT  player,
            count(CASE WHEN outcome = 'w' THEN 1 ELSE NULL END) AS wins,
            count(CASE WHEN outcome = 'l' THEN 1 ELSE NULL END) AS losses,
            count(*) AS total
        FROM
            (SELECT winner AS player, 'w' AS outcome FROM matchups
                UNION ALL
            SELECT loser AS player, 'l' AS outcome FROM matchups) 
                AS matches
        GROUP BY player
    ) AS matches_played on 
    matches_played.player = players.id;
