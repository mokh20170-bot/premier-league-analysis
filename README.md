# ⚽ Premier League 2023/24 — Data Analysis Project

## Overview
End-to-end data analysis project using real Premier League 2023/24 statistics.
Built with Google Sheets, SQL (SQLite + DBeaver), and data visualization.

## Tools Used
- Google Sheets — data cleaning and visualization
- SQL (SQLite + DBeaver) — data querying and analysis
- GitHub — project documentation

## Dataset
4 tables covering the full 2023/24 Premier League season:
- League Table (20 teams)
- Player Stats (366 players)
- Home vs Away performance
- Team Discipline (cards and fouls)

## Key Questions Answered
- Who were the top scorers and assisters?
- Which teams performed better at home vs away?
- Which nationalities contributed the most goals?
- Which teams were the most and least disciplined?

## Charts & Findings

### Top 10 Scorers
[charts/top_scorers.png.png](https://github.com/mokh20170-bot/premier-league-analysis/blob/f195d1b68a1fdf74d9fc8163d35bbfc55780ce5b/Charts/top_scorers.png.png)

### Home vs Away Performance
[charts/home_away.png.png](https://github.com/mokh20170-bot/premier-league-analysis/blob/f195d1b68a1fdf74d9fc8163d35bbfc55780ce5b/Charts/home_away.png.png)

### League Table — Big Six
[charts/league_table.png.png](https://github.com/mokh20170-bot/premier-league-analysis/blob/f195d1b68a1fdf74d9fc8163d35bbfc55780ce5b/Charts/league_table.png.png)

### Team Discipline
[Charts/discipline.png.png](https://github.com/mokh20170-bot/premier-league-analysis/blob/fd04f71608f740409aa11394fc0c5600a389c1da/Charts/discipline.png.png)

### Goals by Nationality
[charts/goals_by_country.png.png](https://github.com/mokh20170-bot/premier-league-analysis/blob/f195d1b68a1fdf74d9fc8163d35bbfc55780ce5b/Charts/goals_by_country.png.png)

### Dashboard
[charts/dashboard.png.png](https://github.com/mokh20170-bot/premier-league-analysis/blob/f195d1b68a1fdf74d9fc8163d35bbfc55780ce5b/Charts/dashboard.png.png)

## SQL Queries
All queries are in the `/sql` folder covering:
- League standings analysis
- Player performance metrics
- Home vs away comparisons
- Team discipline rankings
- Cross-table analysis

## Project Structure
premier-league-analysis/
├── data/         → raw CSV files
├── sql/          → create tables + analysis queries
├── results/      → exported query results
└── charts/       → visualizations

## Author
Built as part of a data analytics learning journey.
