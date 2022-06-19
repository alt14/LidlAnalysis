SELECT ItemName, TaxStatus, COUNT(*) FROM shoppingdata.purchased_items     
GROUP BY ItemName ORDER BY COUNT(*) desc;