--  Data Cleaning, Transformation and Loading using MS Sql Server:
-- 1. Made sure that all the data types of the tables in this dataset are of the right data type.
-- 2. Duplicated the "Date" column.
-- 3. Created a new column "Year" from the duplicate "Date" column and changed the data type to int.
-- 4. Created a new custom column from the "Date" column named "DayOfWeek" (sunday - saturday) using the "Update" and "Set query".
-- 5. Removed the initial duplicate column "New_Date" created from the "Date" column.
-- 6. Made sure that there were no columns with error, null values, or were valid.

SELECT * FROM MSFT;

-- 1. Make sure that all the data types of the tables in this dataset are of the right data type.
EXEC sp_help 'MSFT';
SELECT * FROM MSFT;


-- 2. Duplicated the __"Date"__ column.
ALTER TABLE MSFT
ADD New_Date DATE;

UPDATE MSFT
SET New_Date = Date;

SELECT * FROM MSFT;


-- 3. Created a new column __"Year"__ from the duplicated colume  "New_Date" and changed the data type to int64.
ALTER TABLE MSFT
ADD Year INT;

UPDATE MSFT
SET Year = YEAR(Date);

SELECT * FROM MSFT;


-- 4. Created a new custom column from the "Date" column named "DayOfWeek" (sunday - saturday) using the "Update" and "Set query".
ALTER TABLE MSFT
ADD DayOfWeek TEXT;

UPDATE MSFT
SET DayOfWeek = CASE
                   WHEN DATEPART(WEEKDAY, Date) = 1 THEN 'Sunday'
				   WHEN DATEPART(WEEKDAY, Date) = 1 THEN 'Sunday'
				   WHEN DATEPART(WEEKDAY, Date) = 2 THEN 'Monday'
				   WHEN DATEPART(WEEKDAY, Date) = 3 THEN 'Tuesday'
				   WHEN DATEPART(WEEKDAY, Date) = 4 THEN 'Wednesday'
				   WHEN DATEPART(WEEKDAY, Date) = 5 THEN 'Thursday'
				   WHEN DATEPART(WEEKDAY, Date) = 6 THEN 'Friday'
				   WHEN DATEPART(WEEKDAY, Date) = 7 THEN 'Saturday'
				   ELSE ' '
				 END;

SELECT * FROM MSFT;


-- 5. Removed the initial duplicate column "New_Date" created from the "Date" column.
ALTER TABLE MSFT
DROP COLUMN New_Date;

SELECT * FROM MSFT;

-- 6. Made sure that there were no columns with error, null values, or were valid.
SELECT * FROM MSFT;