--Разує кількість авто з відповідною маркою
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