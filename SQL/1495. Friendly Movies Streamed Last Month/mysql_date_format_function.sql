

SELECT DISTINCT title
FROM TVProgram t
JOIN Content c ON t.content_id = c.content_id
WHERE Kids_content = 'Y' AND content_type = 'Movies' AND 
      DATE_FORMAT(program_date, '%Y-%m') = '2020-06'
      
      
      
