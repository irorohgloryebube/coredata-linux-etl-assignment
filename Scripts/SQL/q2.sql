
#**************************************************
########   Question 2
 #Find the order IDs where:
  # standard_qty is zero
  # AND either gloss_qty OR poster_qty is greater than 1000
#****************************************************
SELECT id
FROM orders
WHERE standard_qty = 0
  AND
    (gloss_qty > 1000 OR poster_qty > 1000)
;
