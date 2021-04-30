

SELECT MIN(America) AS America, -- MIN function considers only non-null values
       MIN(Asia) AS Asia,
       MIN(Europe) AS Europe   
FROM ( 
       -- row_num | America | Asia | Europe
       -- 1       | Jack    | null | null
       -- 1       | null    | null | Pascal
       -- 1       | null    | Xi   | null
       -- 2       | Jane    | null | null
      SELECT CASE
                  WHEN continent = 'America' THEN @r1 := @r1 + 1   -- assign correct row_num for each column
                  WHEN continent = 'Asia' THEN @r2 := @r2 + 1
                  WHEN continent = 'Europe' THEN @r3 := @r3 + 1
             END AS 'row_num',
             CASE WHEN continent = 'America' THEN name END AS America,     -- put name to the correct alias
             CASE WHEN continent = 'Asia' THEN name END AS Asia,
             CASE WHEN continent = 'Europe' THEN name END AS Europe
      FROM student, 
           (SELECT @r1 := 0, @r2 := 0, @r3 := 0) a    -- use assignment operators := to set the user variables
      ORDER BY name) b
GROUP BY row_num;


