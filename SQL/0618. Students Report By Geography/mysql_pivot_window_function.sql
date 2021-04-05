

   # Using CASE to PIVOT rows to Columns
   # Using MAX or MIN function within each group 'row_id' to print names where they exist, if not, NULL is printed
   # MAX function can consider only non-null values
   
SELECT MAX(CASE WHEN continent = 'America' THEN name END) AS America,
       MAX(CASE WHEN continent = 'Asia' THEN name END) AS Asia,
       MAX(CASE WHEN continent = 'Europe' THEN name END) AS Europe 
  
     # Attach a row_id to each Name within its continent
FROM (SELECT name, continent, ROW_NUMBER() OVER(PARTITION BY continent
                                                ORDER BY name) AS row_id
      FROM student) tbl
GROUP BY row_id;



