

SELECT ad_id, 
       ROUND(IF(SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) + SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) = 0, 0, SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) /
       (SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) + SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END))) * 100, 2) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id;



