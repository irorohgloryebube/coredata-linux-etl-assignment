
#**************************************************
######## Question4
#Provide a table that shows:
   # the region name
   # the sales rep name
   #the account name
#****************************************************

SELECT
     r.name AS region_name,
     s.name AS sales_rep_name,
     a.name AS account_name
FROM region r
JOIN sales_rep s
     ON r.id = s.region_id
LEFT JOIN accounts a
     ON s.id = a.sales_rep_id
ORDER BY a.name ASC
;
