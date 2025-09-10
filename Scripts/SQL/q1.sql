#**************************************************

######## Question 1
# Find the order IDs where either gloss_qty OR poster_qty
#is greater than 4000.
#****************************************************
SELECT id
FROM orders
WHERE gloss_qty > 4000
  OR poster_qty > 4000
;
