# **Premier League Team Analysis 2000-01 to 2021-22**

# Overview
This project analyzes 22 seasons of English Premier League (EPL) data, covering team performance metrics, seasonal standings, and long-term trends. The analysis uses tools such as Python for data preparation, SQL for exploratory data analysis (EDA), and Power BI for visualization.


## Objectives

- Clean and transform raw EPL data for meaningful insights. 
- Perform exploratory data analysis (EDA) to uncover trends and patterns.
- Visualize key metrics and trends using Power BI.
- Highlight performance metrics of teams, including wins, losses, goals, and points.


## Dataset
The dataset contains Premier League standings from the 2000/01 to 2021/22 seasons. It includes the following columns:

- Season: The football season (e.g., 2000-01).
- Position: Final league position of the team.
- Team: Name of the football team.
- Games Played (Pld): Number of matches played.
- Wins (W): Total matches won.
- Draws (D): Total matches drawn.
- Losses (L): Total matches lost.
- Goals For (GF): Total goals scored.
- Goals Against (GA): Total goals conceded.
- Goal Difference (GD): Difference between goals scored and goals conceded.
- Points (Pts): Total points earned.
- Season Outcome: Qualification, relegation, or other outcomes.


## Tools and Technologies
- Python: Used for data cleaning, transformation, and some advanced data analysis with visualizations. (Libraries used: pandas, matplotlib, seaborn).
- SQL: Performed exploratory data analysis.
- Power BI: Created interactive dashboards and visualizations.


## Data Cleaning and Transformation (Python)
- Renamed columns for better readability.
- Handled missing and inconsistent values.
- Simplified categorical data in the "Season Outcome" column.
- Added new calculated columns:
  1. Win Percentage: (Wins / Games Played) * 100
  2. Loss Percentage: (Losses / Games Played) * 100
  3. Goals Per Game: Goals For / Games Played
  4. Points Per Game: Points / Games Played
  5. Draw Percentage: (Draws / Games Played) * 100
- Advanced Data Analysis
  1. Finding Correlation between Goal Difference and Points using scatter plot with regression line.
  2. Identifying consistent top 4 teams and showing their trends using line plot.

The cleaned dataset was exported as a CSV file for SQL analysis.


## Exploratory Data Analysis (EDA) (SQL)

 ### Basic:
 - Champions from all season
 - Number of distinct teams
 - Top performing team from the 22 seasons
 - Top non performing team who played at least 20 seasons
 - Average metrics of team
 - Average win percentage
 - Goals scored across all seasons
 - Goals conceded scored across all seasons for team who played at least 15 seasons
 - All teams who played at least 1 season
 - Teams and number of season they played the league

### Intermediate:
- Number of times a team has won the League
- Recent Winners (2017-18 to 2021-22)
- Top 5 goals scoring team between 2000-2022
- Top relegated teams over last 22 years
- Top 5 teams with the best points per game
- Most relegated teams
- Goal difference trends of champions over the years

### Advanced:
- Minimum points required to avoid relegation and difference between 18th ranked team and 17th ranked team
- Minimum points required to be in top 4 and difference between 5th placed team and 4th placed team
- By how many points team won the league (Difference between 1st placed team and 2nd placed team)
- Consistent team of last 22 years (use ranking) all time ranking
- Teams that have never been relegated
- Teams that have never been relegated and appeared in at least 20 seasons
- Highest-scoring teams vs. lowest conceding teams.

### Trends:
- Changes in  points required to qualify for UCL or avoid relegation over seasons.
- Changes in average points required to qualify for UCL or avoid relegation over seasons.
- Point difference to become first
- Standard Deviation of points

## Power BI Visualizations
Key Dashboards and Charts
- Number of League Titles Won by Teams: Pie chart showing the number of championships won by teams.
- Big 6 Performance: Stacked bar chart visualizing wins, losses, and draws of the "Big 6" teams.
- Top 10 Scoring Teams: Bar chart of the top 10 teams by total goals scored (last 20 seasons).
- Position Points Comparison: Clustered column chart comparing points of 1st and 2nd positions over 5 seasons.
- Top 5 teams Trends: Line chart comparing the top 5 team's points over the years.
- All Teams Participation: Tree map showing number of games played by each team over last 20 years.
- Goals scored and conceded trend: Line chart showing the trend of number of goals scored and conceded of a specific team (using slicers) over the years.

Dashboard Title
"PREMIER LEAGUE TEAM ANALYSIS: 2000-01 to 2021-22"


## How to Use
- Clone the repository.
- Install the required Python libraries 
- Run the Jupyter Notebook to clean and transform the data.
- Load the cleaned CSV file into SQL for further analysis.
- Open the Power BI file (.pbix) to explore interactive visualizations.


## Credits
Data Source: Premier League Standings 22 Seasons (2000-2022) (Kaggle)
https://www.kaggle.com/datasets/quadeer15sh/premier-league-standings-11-seasons-20102021 


## Contact
For any questions or collaboration, feel free to reach out!
