USE quickride;
-- No 1
SELECT trip_id, rider_name, fare
FROM trips
WHERE city = 'lagos';

-- No 2 
SELECT rider_name, city, fare 
FROM trips 
WHERE status = 'Completed' 
ORDER BY fare DESC
LIMIT 5

-- No 3
SELECT city
FROM trips;

-- No 4
SELECT *
FROM trips
WHERE payment_method = 'Card' ;

-- No 5-- 
SELECT *
FROM trips
WHERE distance_km 
BETWEEN '5' AND '10';

-- No 6-- 
SELECT driver_id
FROM trips
WHERE driver_id LIKE 'A%';

-- No 7
SELECT *
FROM trips
WHERE payment_method = 'Card'
	OR payment_method = 'Wallet';
    
-- No 8
SELECT	rating
FROM trips
WHERE rating = 0