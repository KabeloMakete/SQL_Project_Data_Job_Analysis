/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understandd which skills to develop that align with top salaries
    */
WITH top_paying_jobs AS(
SELECT
job_id,
job_title,
salary_year_avg,
name AS company_name
FROM
Job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT
top_paying_jobs.*,
skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
salary_year_avg DESC

/*
These skills appeared most frequently in 2023 Data Analyst job postings and reflect core expectations for data analyst roles:

-SQL with count of (8), Most in-demand skill — nearly every analyst role requires strong SQL competence.	
-Python with a count of (7), Essential for data analysis, automation, and building robust pipelines.	
-Tableau with a count of (6), Indicates strong emphasis on data visualization & business intelligence.	
-Other moderately common skills are :
R with a count of (4)	Still relevant, especially in research-oriented or statistical roles.	
Snowflake, Pandas, Excel with count of (3 each)	Cloud data warehouses + Python libraries + Excel fundamentals remain important.	
Azure, Bitbucket, Go, Oracle, Power BI, Jira, Confluence, GitLab, AWS, NumPy with count of (2 each)	Suggests hybrid roles that combine analytics with cloud, DevOps, and agile collaboration tools.	
*/

