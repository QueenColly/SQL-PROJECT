USE quickride;

SELECT trip_id, rider_name, fare
FROM trips
WHERE city = 'Lagos';

SELECT rider_name, city, fare
FROM trips
ORDER BY fare DESC
LIMIT 5;

SELECT DISTINCT city
FROM trips;

SELECT *
FROM trips
WHERE payment_method = 'Card'
  AND fare > 5000;

SELECT *
FROM trips
WHERE distance_km BETWEEN 5 AND 10;

SELECT *
FROM trips
WHERE rider_name LIKE 'A%';

SELECT *
FROM trips
WHERE payment_method IN ('Card', 'Wallet');

SELECT *
FROM trips
WHERE rating IS NULL;

SELECT *
FROM trips
WHERE status = 'Completed'
ORDER BY city ASC, fare DESC;

SELECT COUNT(*) AS cancelled_trips
FROM trips
WHERE status = 'Cancelled';

SELECT
    SUM(fare) AS total_revenue,
    AVG(fare) AS average_fare,
    MAX(fare) AS biggest_fare,
    MIN(fare) AS smallest_fare
FROM trips
WHERE status = 'Completed';

SELECT
    vehicle_type,
    COUNT(*) AS trip_count
FROM trips
GROUP BY vehicle_type;

SELECT
    city,
    SUM(fare) AS total_revenue
FROM trips
WHERE status = 'Completed'
GROUP BY city
ORDER BY total_revenue DESC;

SELECT
    city,
    AVG(rating) AS average_rating
FROM trips
GROUP BY city
HAVING AVG(rating) < 4.0;

SELECT
    trips.trip_id,
    trips.rider_name,
    trips.driver_id,
    drivers.driver_name,
    drivers.home_city
FROM trips
JOIN drivers
    ON trips.driver_id = drivers.driver_id;

SELECT
    drivers.driver_name,
    COUNT(trips.trip_id) AS trip_count
FROM trips
JOIN drivers
    ON trips.driver_id = drivers.driver_id
GROUP BY drivers.driver_id, drivers.driver_name
HAVING COUNT(trips.trip_id) > 6;
