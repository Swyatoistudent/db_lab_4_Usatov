INSERT INTO Engine_Type (engine_id, engine_type,engine_size)
VALUES(1, 'Diesel', 3.0),(2, 'Petrol',4.4),(3, 'Petrol',1.0),(4,'Petrol',4.0);

INSERT INTO Cars(car_id,make, model, mileage, engine_id)
VALUES(12000, 'merc','GLS Class',12046, 1),
      (12013,'skoda', 'Scala',   3257, 3),
      (12329,'skoda', 'Scala',   3572, 3),
      (12049,'bmw', '7 Series', 70500, 1),
      (12071,'bmw', 'M5', 2269, 2),
      (12040,'audi', 'RS6',  41854,    4),
      (12041, 'merc','S Class',39203, 1),
      (12119,'bmw', 'X7', 5600, 1)





-- Populate Customers table



INSERT INTO Lot (lot_id, car_id, price)
VALUES(1, 12000, 31995),
      (2, 12013, 7700),
      (3, 12329, 7900),
      (4, 12049, 12999),
      (5, 12071, 136500),
      (6, 12040, 120000),
      (7, 12041, 60000),
      (8, 12119, 100500);


