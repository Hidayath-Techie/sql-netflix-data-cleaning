-- SQL Data Cleaning Project: Netflix Titles

-- Step 1: Create staging table
CREATE TABLE netflix_staging LIKE netflix_titles;
INSERT INTO netflix_staging SELECT * FROM netflix_titles;

-- Step 2: Remove duplicates
DELETE FROM netflix_staging
WHERE id NOT IN (
    SELECT MIN(id)
    FROM netflix_staging
    GROUP BY title, director, type, date_added
);

-- Step 3: Convert date format
UPDATE netflix_staging
SET date_added = STR_TO_DATE(date_added, '%B %d, %Y');

-- Step 4: Standardize values (e.g., TV Show)
UPDATE netflix_staging
SET type = 'TV Show'
WHERE type IN ('TV Shows', 'Tv Show');

-- Step 5: Trim whitespace
UPDATE netflix_staging
SET title = TRIM(title);

-- Step 6: Handle NULLs
UPDATE netflix_staging t1
JOIN netflix_staging t2 ON t1.title = t2.title AND t1.country IS NULL AND t2.country IS NOT NULL
SET t1.country = t2.country;

-- Step 7: Remove rows with no title or type or date
DELETE FROM netflix_staging
WHERE title IS NULL OR type IS NULL OR date_added IS NULL;

-- Final table
SELECT * FROM netflix_staging;