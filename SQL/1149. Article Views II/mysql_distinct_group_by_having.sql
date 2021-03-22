


SELECT DISTINCT viewer_id AS id
FROM (SELECT DISTINCT *
      FROM Views) a
GROUP BY viewer_id, view_date
HAVING COUNT(article_id) > 1
ORDER BY id;


