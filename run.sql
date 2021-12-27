-- procedure

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

CALL cars_by_max_mileage(20000)

-- function

CREATE OR REPLACE FUNCTION make_counter(makes char(20)) RETURNS int AS
$$
  DECLARE
    result_ integer;
  BEGIN
    SELECT COUNT(*) INTO result_
    FROM cars
      WHERE cars.make = makes;

    RETURN result_;
  END;
$$ LANGUAGE 'plpgsql';

SELECT * FROM make_counter("skoda")

-- trigger

CREATE FUNCTION lot_del() RETURNS trigger AS $lot_del$
    BEGIN

        DELETE FROM cars
        WHERE cars.car_id = OLD.car_id;
		RETURN OLD;
    END;
$lot_del$ LANGUAGE plpgsql;

CREATE TRIGGER lot_del AFTER  DELETE ON lot
    FOR EACH ROW EXECUTE PROCEDURE lot_del();
select * from cars;
DELETE from lot where car_id=12013;
select * from cars;