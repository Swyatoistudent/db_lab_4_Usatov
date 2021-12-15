SELECT ROUND(AVG(mileage), 2) as avg_miles, make
FROM Cars
GROUP BY make
ORDER BY avg_miles

SELECT COUNT(engine_id) as amount, engine
FROM Cars INNER JOIN Engine USING(engine_id)
GROUP BY engine
ORDER BY amount

SELECT AVG(price) as amount, make
FROM Lot INNER JOIN Cars USING(car_id)
GROUP BY make