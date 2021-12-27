--Видаляє значення з таблиці cars після видалленя в lot
CREATE FUNCTION lot_del() RETURNS trigger AS $lot_del$
    BEGIN

        DELETE FROM cars
        WHERE cars.car_id = OLD.car_id;
		RETURN OLD;
    END;
$lot_del$ LANGUAGE plpgsql;

CREATE TRIGGER lot_del AFTER  DELETE ON lot
    FOR EACH ROW EXECUTE PROCEDURE lot_del();