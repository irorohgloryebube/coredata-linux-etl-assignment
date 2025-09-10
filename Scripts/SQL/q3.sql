
#**************************************************
########  Question 3
  #From the accounts table, return the account names where:
  # the name starts with 'C' or 'W'
  #AND the primary_poc (point of contact) contains 'ana' or 'Ana'
#****************************************************
SELECT name
FROM accounts
WHERE (name like 'C%' OR name like 'W%')
    AND primary_poc ilike '%ana%'
;
