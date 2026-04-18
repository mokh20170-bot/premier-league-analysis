-- ============================================================
--  PREMIER LEAGUE 2023/24 — STEP 2: ANALYSIS QUERIES
--  Run AFTER tables are created and data is imported.
-- ============================================================


-- ============================================================
--  SECTION A: LEAGUE TABLE ANALYSIS
-- ============================================================

-- A1. Full league table ordered by position
SELECT
    position,
    team,
    played,
    wins,
    draws,
    losses,
    goals_for,
    goals_against,
    (goals_for - goals_against) AS goal_difference,
    points,
    goals_per_match
FROM league_table
ORDER BY position;


-- A2. Top 6 teams (European contenders)
SELECT position, team, points, wins, goals_for, goals_against
FROM league_table
ORDER BY position
LIMIT 6;


-- A3. Bottom 3 teams (relegation zone)
SELECT position, team, points, wins, losses, goals_for, goals_against
FROM league_table
ORDER BY position DESC
LIMIT 3;


-- A4. Teams with more than 70 points
SELECT team, points, wins, goals_per_match
FROM league_table
WHERE points > 70
ORDER BY points DESC;


-- A5. Average points, goals scored and goals conceded across the league
SELECT
    ROUND(AVG(points), 1)        AS avg_points,
    ROUND(AVG(goals_for), 1)     AS avg_goals_scored,
    ROUND(AVG(goals_against), 1) AS avg_goals_conceded
FROM league_table;


-- A6. Most attacking teams (highest goals scored)
SELECT team, goals_for, goals_against, (goals_for - goals_against) AS goal_diff
FROM league_table
ORDER BY goals_for DESC
LIMIT 5;


-- ============================================================
--  SECTION B: HOME vs AWAY ANALYSIS
-- ============================================================

-- B1. Full home vs away breakdown
SELECT
    team,
    points_home,
    points_away,
    home_advantage_pts,
    goal_diff_home,
    goal_diff_away
FROM home_vs_away
ORDER BY home_advantage_pts DESC;


-- B2. Teams with the biggest home advantage
SELECT team, home_advantage_pts, points_home, points_away
FROM home_vs_away
ORDER BY home_advantage_pts DESC
LIMIT 5;


-- B3. Best away teams (most away points)
SELECT team, points_away, wins_away, draws_away, losses_away, goal_diff_away
FROM home_vs_away
ORDER BY points_away DESC
LIMIT 5;


-- B4. Teams that performed better away than at home (negative home advantage)
SELECT team, home_advantage_pts, points_home, points_away
FROM home_vs_away
WHERE home_advantage_pts < 0
ORDER BY home_advantage_pts;


-- B5. Teams with a perfect or near-perfect home record (0 or 1 home loss)
SELECT team, wins_home, draws_home, losses_home, points_home
FROM home_vs_away
WHERE losses_home <= 1
ORDER BY points_home DESC;


-- B6. Total home points vs total away points across the league
SELECT
    SUM(points_home)  AS total_home_points,
    SUM(points_away)  AS total_away_points,
    SUM(points_home) - SUM(points_away) AS home_advantage_total
FROM home_vs_away;


-- ============================================================
--  SECTION C: PLAYER STATS ANALYSIS
-- ============================================================

-- C1. Top 10 players by goal contributions
SELECT rank, player, team, country, goals, assists, goal_contributions
FROM player_stats
ORDER BY goal_contributions DESC
LIMIT 10;


-- C2. Top scorers (most goals, min 10 matches played)
SELECT player, team, country, goals, penalties, goals_per_match, matches
FROM player_stats
WHERE matches >= 10
ORDER BY goals DESC
LIMIT 10;


-- C3. Top assisters (min 10 matches)
SELECT player, team, country, assists, assists_per_match, matches
FROM player_stats
WHERE matches >= 10
ORDER BY assists DESC
LIMIT 10;


-- C4. Most efficient scorers — goals per match (min 15 matches)
SELECT player, team, country, goals, matches, goals_per_match
FROM player_stats
WHERE matches >= 15
ORDER BY goals_per_match DESC
LIMIT 10;


-- C5. Players with the most penalties scored
SELECT player, team, goals, penalties,
       (goals - penalties) AS non_penalty_goals
FROM player_stats
WHERE penalties > 0
ORDER BY penalties DESC
LIMIT 10;


-- C6. Goals scored by country (nationality breakdown)
SELECT
    country,
    COUNT(player)       AS num_players,
    SUM(goals)          AS total_goals,
    SUM(assists)        AS total_assists,
    SUM(goal_contributions) AS total_contributions
FROM player_stats
WHERE country IS NOT NULL AND country <> ''
GROUP BY country
ORDER BY total_goals DESC
LIMIT 15;


-- C7. Top contributors per team (best player per team by goal contributions)
SELECT p.team, p.player, p.goals, p.assists, p.goal_contributions
FROM player_stats p
INNER JOIN (
    SELECT team, MAX(goal_contributions) AS max_gc
    FROM player_stats
    GROUP BY team
) t ON p.team = t.team AND p.goal_contributions = t.max_gc
ORDER BY p.goal_contributions DESC;


-- C8. Players with yellow or red cards (disciplinary concerns)
SELECT player, team, matches, yellow_cards, red_cards,
       (yellow_cards + red_cards * 3) AS discipline_score
FROM player_stats
WHERE yellow_cards > 5 OR red_cards > 0
ORDER BY discipline_score DESC
LIMIT 15;


-- ============================================================
--  SECTION D: TEAM DISCIPLINE
-- ============================================================

-- D1. Full discipline table
SELECT rank, team, yellow_cards, red_cards, discipline_score, cards_per_match
FROM team_discipline
ORDER BY rank;


-- D2. Most disciplined teams (lowest score)
SELECT team, yellow_cards, red_cards, discipline_score, cards_per_match
FROM team_discipline
ORDER BY discipline_score
LIMIT 5;


-- D3. Least disciplined teams (highest score)
SELECT team, yellow_cards, red_cards, discipline_score, cards_per_match
FROM team_discipline
ORDER BY discipline_score DESC
LIMIT 5;


-- D4. Average cards per match across the league
SELECT
    ROUND(AVG(yellow_cards), 1)    AS avg_yellow_per_team,
    ROUND(AVG(red_cards), 1)       AS avg_red_per_team,
    ROUND(AVG(cards_per_match), 2) AS avg_cards_per_match
FROM team_discipline;


-- ============================================================
--  SECTION E: CROSS-TABLE ANALYSIS (Advanced)
-- ============================================================

-- E1. Combine league position with discipline data
SELECT
    lt.position,
    lt.team,
    lt.points,
    td.yellow_cards,
    td.red_cards,
    td.discipline_score,
    td.cards_per_match
FROM league_table lt
JOIN team_discipline td ON lt.team = td.team
ORDER BY lt.position;


-- E2. Does home advantage correlate with league position?
SELECT
    lt.position,
    lt.team,
    lt.points,
    ha.home_advantage_pts,
    ha.points_home,
    ha.points_away
FROM league_table lt
JOIN home_vs_away ha ON lt.team = ha.team
ORDER BY lt.position;


-- E3. Top teams' star players (top 6 clubs by position)
SELECT
    ps.player,
    ps.team,
    ps.goals,
    ps.assists,
    ps.goal_contributions,
    lt.position AS league_position
FROM player_stats ps
JOIN league_table lt ON ps.team = lt.team
WHERE lt.position <= 6
  AND ps.goal_contributions >= 10
ORDER BY lt.position, ps.goal_contributions DESC;


-- E4. Full team summary — everything in one view
SELECT
    lt.position,
    lt.team,
    lt.points,
    lt.goals_for,
    lt.goals_against,
    ha.home_advantage_pts,
    td.discipline_score,
    td.cards_per_match
FROM league_table lt
LEFT JOIN home_vs_away  ha ON lt.team = ha.team
LEFT JOIN team_discipline td ON lt.team = td.team
ORDER BY lt.position;
