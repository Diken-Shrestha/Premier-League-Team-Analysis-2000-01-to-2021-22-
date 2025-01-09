SELECT * FROM epl_team_data.cleaned_epl_data;


-- English Premier League Team Analysis (2000-2002) (2000/01 season to 2021/22 season)
select * from cleaned_epl_data;

-- Basic


-- Champions from all season
SELECT season as Season, team as Champions, points as Points
FROM cleaned_epl_data
WHERE position = 1;

-- Total number of distinct teams
select count(distinct(team))
from cleaned_epl_data;


-- Top performing team from the 22 seasons
select team, sum(wins) as total_wins, sum(losses) as total_losses, sum(draw) as total_draws, sum(points) as total_points 
from cleaned_epl_data
group by team
order by total_points desc;

-- Top non performing team who played at least 20 seasons
select team, sum(games_played) as total_games_played, sum(wins) as total_wins, sum(losses) as total_losses, sum(draw) as total_draws, sum(points) as total_points 
from cleaned_epl_data
group by team
having count(distinct season) >= 10
order by total_points asc;


-- Average metrics of team 
select team, round(avg(wins), 2) as total_wins, round(avg(losses),2) as total_losses, round(avg(draw),2) as total_draws, round(avg(points),2) as total_points 
from cleaned_epl_data
group by team
order by total_points desc;


-- Average win percentage
SELECT team, round(AVG(win_percentage), 2) AS avg_win_percentage
FROM cleaned_epl_data
GROUP BY team
ORDER BY avg_win_percentage DESC;

-- Goals scored across all seasons
select team, avg(goals_for) as avg_goals_per_season
FROM cleaned_epl_data
group by team
order by avg_goals_per_season desc;


-- Goals conceded scored across all seasons for team who played atleast 15 seasons
select team, avg(goals_against) as avg_goals_conceded_per_season
FROM cleaned_epl_data
group by team
having count(distinct season) >= 15
order by avg_goals_conceded_per_season desc;


-- All teams who played atleast 1 season
select distinct team 
from cleaned_epl_data
order by team;

-- Teams and number of season they played the league
select team, count(distinct season) as a
from cleaned_epl_data
group by team
order by a desc, team asc;


-- most consistent teams
select team, round(avg(position), 2) as avg_ranking
from cleaned_epl_data
group by team
order by avg_ranking;


-- Intermediate
-- average position of team who has played 20 or more seasons:
select team, round(avg(position), 2) as avg_position
from cleaned_epl_data
group by team
having count(distinct season) >= 20
order by avg_position;



-- Number of times a team has won the League
select team, count(*) as League_won
from cleaned_epl_data
where position = 1
group by team
order by League_won desc;

-- Recent Winners (2017-18 to 2021-22)
select team as Champion, season as Season
from cleaned_epl_data
where position = 1
group by team, season
order by season desc
limit 5;

-- Top 5 goals scoring team between 2000-2022
select team, sum(goals_for) as total_goals_scored
from cleaned_epl_data
group by team
order by total_goals_scored desc
limit 5;


-- Top 5 teams with the best points per game

select team, round(avg(points_per_game), 2) as avg_points_per_game
from cleaned_epl_data
group by team
order by avg_points_per_game desc;


-- Most relegated teams:
select team, count(*) as Number_of_relegation
from cleaned_epl_data
where cleaned_season_outcome = 'Relegation'
group by team
order by Number_of_relegation desc, team asc;

select * from cleaned_epl_data;

-- Goal difference trends of champions over the years
SELECT season, team, goal_difference, points
FROM cleaned_epl_data
WHERE position = 1;

-- Highest-scoring teams vs. lowest conceding teams.
with cte1 as
(
select team as highest_scoring_team , sum(goals_for) as most_goals_scored
from cleaned_epl_data
group by team
having count(distinct season) = 22
order by most_goals_scored desc
limit 1
),
cte2 as 
(
select team as lowest_conceding_team , sum(goals_against) as least_goals_conceded
from cleaned_epl_data
group by team
having count(distinct season) = 22
order by least_goals_conceded asc
limit 1
) 
SELECT
    (SELECT highest_scoring_team  FROM cte1) AS "Highest_scoring_teams",
    (SELECT most_goals_scored  FROM cte1) as "Total_goals_scored",
    (SELECT lowest_conceding_team  FROM cte2) AS "Lowest_conceding_teams",
	(SELECT least_goals_conceded  FROM cte2) AS "Total_goals_conceded";






-- Advanced

-- Minimum points required to avoid relegation and difference between 18th ranked team and 17th ranked team

with cte as
(
select season, points as fourth_plced
from cleaned_epl_data
where position = 17
),
cte2 as 
(
select season, points as fifth_placed
from cleaned_epl_data
where position = 18
)
select cte.season, cte.fourth_plced, cte2.fifth_placed, (cte.fourth_plced - cte2.fifth_placed) as diff
from cte
join cte2 on cte.season = cte2.season;




-- Minimum points required to be in top 4 and difference between 5th placed team and 4th placed team

with cte as
(
select season, points as fourth_placed
from cleaned_epl_data
where position = 4
),
cte2 as 
(
select season, points as fifth_placed
from cleaned_epl_data
where position = 5
)
select cte.season, cte.fourth_placed, cte2.fifth_placed, (cte.fourth_placed - cte2.fifth_placed) as diff
from cte
join cte2 on cte.season = cte2.season;



-- Difference between 1st and 2nd team point
-- By how many points a team won the league

with cte as
(
select season, points as First
from cleaned_epl_data
where position = 1
),
cte2 as 
(
select season, points as Second
from cleaned_epl_data
where position = 2
)
select cte.season, cte.First, cte2.Second, (cte.First - cte2.Second) as diff
from cte
join cte2 on cte.season = cte2.season
order by diff asc;

-- same problem but using case statements here 
SELECT season, 
       MAX(CASE WHEN position = 1 THEN points ELSE NULL END) - 
       MAX(CASE WHEN position = 2 THEN points ELSE NULL END) AS point_difference
FROM cleaned_epl_data
GROUP BY season
order by point_difference asc;

-- SD
select season, round(stddev(points), 2) as points_sd
FROM cleaned_epl_data
GROUP BY season
order by points_sd asc;

-- Rank team based on Total Performance 
select rank() over (order by sum(points) desc) as all_time_ranking,
team, sum(points) as total_points 
from cleaned_epl_data
group by team
order by total_points desc;


-- Rank team based on Total Performance with additional information
select rank() over (order by sum(points) desc) as all_time_ranking,
team, sum(points) as total_points, sum(games_played) as total_games_played,
sum(wins) as total_wins, sum(losses) as total_loss, sum(draw) as total_draw,
sum(goals_for) as total_goals_scored, sum(goals_against) as total_goal_against
from cleaned_epl_data
group by team
order by total_points desc;

-- Teams that have never been relegated

select team from cleaned_epl_data
where cleaned_season_outcome != 'Relegation';

SELECT DISTINCT team
FROM cleaned_epl_data
WHERE team NOT IN (
    SELECT DISTINCT team
    FROM cleaned_epl_data
    WHERE season_outcome LIKE '%Relegation%'
);


-- Teams that have never been relegated and appeared in at least 20 seasons
WITH relegated_teams AS (
    SELECT DISTINCT team
    FROM cleaned_epl_data
    WHERE season_outcome LIKE '%Relegation%'
),
team_season_count AS (
    SELECT 
        team, 
        COUNT(DISTINCT season) AS total_seasons
    FROM cleaned_epl_data
    GROUP BY team
)
SELECT DISTINCT t.team
FROM team_season_count t
LEFT JOIN relegated_teams r ON t.team = r.team
WHERE r.team IS NULL  -- Exclude relegated teams
  AND t.total_seasons >= 20; -- Include only teams with at least 20 seasons;



-- Longest Champions Streak

select * from cleaned_epl_data;



