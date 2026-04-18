-- ============================================================
--  PREMIER LEAGUE 2023/24 — STEP 1: CREATE TABLES
--  Run this first in DBeaver before importing any data.
-- ============================================================

-- Drop tables if they already exist (safe re-run)
DROP TABLE IF EXISTS player_stats;
DROP TABLE IF EXISTS home_vs_away;
DROP TABLE IF EXISTS team_discipline;
DROP TABLE IF EXISTS league_table;

-- ------------------------------------------------------------
-- 1. League Table
-- ------------------------------------------------------------
CREATE TABLE league_table (
    position        INT,
    team            VARCHAR(100),
    played          INT,
    wins            INT,
    draws           INT,
    losses          INT,
    goals_for       INT,
    goals_against   INT,
    points          INT,
    goals_per_match DECIMAL(4,2)
);

-- ------------------------------------------------------------
-- 2. Home vs Away Performance
-- ------------------------------------------------------------
CREATE TABLE home_vs_away (
    team                VARCHAR(100),
    wins_home           INT,
    draws_home          INT,
    losses_home         INT,
    goal_diff_home      INT,
    points_home         INT,
    wins_away           INT,
    draws_away          INT,
    losses_away         INT,
    goal_diff_away      INT,
    points_away         INT,
    home_advantage_pts  INT
);

-- ------------------------------------------------------------
-- 3. Player Stats
-- ------------------------------------------------------------
CREATE TABLE player_stats (
    rank                INT,
    player              VARCHAR(100),
    team                VARCHAR(100),
    country             VARCHAR(10),
    matches             INT,
    minutes             INT,
    goals               INT,
    penalties           INT,
    assists             INT,
    secondary_assists   DECIMAL(5,1),
    goal_contributions  INT,
    goals_per_match     DECIMAL(5,2),
    assists_per_match   DECIMAL(5,2),
    yellow_cards        INT,
    red_cards           INT
);

-- ------------------------------------------------------------
-- 4. Team Discipline
-- ------------------------------------------------------------
CREATE TABLE team_discipline (
    rank              INT,
    team              VARCHAR(100),
    matches           INT,
    yellow_cards      INT,
    red_cards         INT,
    discipline_score  INT,
    cards_per_match   DECIMAL(4,2)
);
