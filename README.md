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
![Top Scorers](charts/Top%2010%20Premier%20League%20Scorers%202023_24.png)

### Home vs Away Performance
![Home vs Away](charts/Home%20vs%20Away%20Points%20%E2%80%94%20PL%202023_24.png)

### League Table — Big Six
![League Table](charts/League%20Table%20-%20Big%20Six.png)

### Team Discipline
![Discipline](charts/Team%20Discipline%20%E2%80%94%20PL%202023_24%20(1).png)

### Goals by Nationality
![Goals by Country](charts/Premier%20League%20Goals%20by%20Nationality%202023_24.png)

### Dashboard
![Dashboard](charts/Results_Dashboard.png)

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
