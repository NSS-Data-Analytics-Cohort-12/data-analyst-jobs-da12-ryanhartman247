-- 1.	How many rows are in the data_analyst_jobs table?
-- SELECT COUNT(*)
-- FROM data_analyst_jobs;
-- Answer: 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10;
-- Answer: ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-- SELECT 
-- 	location,
-- 	COUNT(*)
-- FROM data_analyst_jobs
-- WHERE location = 'TN' OR location = 'FL'
-- GROUP BY 1;
-- Answer: FL = 44 and TN = 21

-- 4.	How many postings in Tennessee have a star rating above 4?
-- SELECT COUNT(*)
-- FROM data_analyst_jobs
-- WHERE star_rating > 4 
-- 	AND location = 'TN'
-- Answer: 3

-- 5.	How many postings in the dataset have a review count between 500 and 1000?
-- SELECT *
-- FROM data_analyst_jobs 
-- WHERE review_count BETWEEN 500 AND 1000
-- Answer: 151

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
-- SELECT 
-- 	location AS state, 
-- 	AVG(star_rating) AS avg_rating
-- FROM data_analyst_jobs
-- GROUP BY 1 
-- ORDER BY 2 desc

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs
-- Answer: 881

-- 8.	How many unique job titles are there for California companies?
-- SELECT 
-- 	DISTINCT title,
-- 	location
-- FROM data_analyst_jobs
-- WHERE location = 'CA'
-- Answer: 230

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-- SELECT 
-- 	company,
-- 	review_count,
-- 	AVG(star_rating)
-- FROM data_analyst_jobs
-- GROUP BY company, review_count
-- HAVING review_count > 5000
-- ORDER BY 3 desc
-- Answer: 46

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- SELECT 
-- 	company,
-- 	review_count,
-- 	ROUND(AVG(star_rating), 2) AS avg_star_rating
-- FROM data_analyst_jobs
-- GROUP BY company, review_count
-- HAVING review_count > 5000
-- ORDER BY 3 desc
-- Amswer: Microsoft - 4.2 

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
-- SELECT DISTINCT *
-- FROM data_analyst_jobs
-- WHERE
-- 	title iLIKE '%Analyst%' -- iLIKE is case insensitive 
-- Answer: 1600

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
-- SELECT DISTINCT *
-- FROM data_analyst_jobs
-- WHERE
-- 	title NOT iLIKE '%analyst%' -- iLIKE is case insensitive 
-- 	AND title NOT iLIKE '%analytics%' -- iLIKE is case insensitive 
-- Answer: 4
-- Answer: Data, Tableau, Visualization

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
-- SELECT 
-- 	domain AS industry,
-- 	COUNT(*) AS count_skill
-- FROM data_analyst_jobs
-- WHERE 
-- 	skill iLIKE '%sql%'
-- 	AND days_since_posting > 21
-- 	AND domain IS NOT NULL
-- GROUP BY 1
-- ORDER BY 2 desc
-- Answer: Top 3 industries 
	-- 1. "Internet and Software" (62 jobs)
	-- 2. "Banks and Financial Services" (61 jobs)
	-- 3. "Consulting and Business Services" (57 jobs) 
-- 

