# Queries used for Tableau Project

-- 1.

SELECT 
	SUM(new_cases) AS total_cases, 
    SUM(CAST(new_deaths AS SIGNED)) AS total_deaths, 
    SUM(CAST(new_deaths AS SIGNED))/SUM(new_cases)*100 AS death_percentage
FROM coviddeaths
WHERE continent != ''
# GROUP BY date
ORDER BY 1, 2;


-- 2.
# Exclude World, International and European Union from dataset
# European Union is part of Europe

SELECT 
    continent,
    SUM(CAST(new_deaths AS SIGNED)) AS total_deaths_count
FROM coviddeaths
WHERE continent != ''
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY continent
ORDER BY 2 DESC;


-- 3.
# Find percentage of infected population in each location

SELECT 
	location,
    population, 
    MAX(total_cases) AS highest_infection, 
    MAX((total_cases/population))*100 AS population_infected_percentage
FROM coviddeaths
GROUP BY 1, 2
ORDER BY population_infected_percentage DESC;

-- 4.

SELECT 
	location, 
	population,
	date,
	MAX(total_cases) AS highest_infection, 
	MAX((total_cases/population))*100 AS population_infected_percentage
FROM coviddeaths
GROUP BY 1, 2, 3
ORDER BY population_infected_percentage DESC;



