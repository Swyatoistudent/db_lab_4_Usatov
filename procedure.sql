--всі модулі пробіг який менше за вказаний
CREATE OR REPLACE PROCEDURE cars_by_max_mileage(max_mileage integer)
LANGUAGE plpgsql AS
$$
  DECLARE
    temp_rec record;
  BEGIN
    FOR temp_rec IN
      SELECT cars.model
      FROM cars
      WHERE cars.mileage < max_mileage
    LOOP
      RAISE INFO 'Model by max_mileage: %', temp_rec.model;
    END LOOP;
  END;
$$;