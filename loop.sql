select * from engine;
-- create table engine_copy as select * from engine;
-- delete from engine_copy;

select * from engine_copy;

DO $$
DECLARE
    engine_id   engine_copy.engine_id%TYPE;
    engine_type engine_copy.engine_type%TYPE;
    engine_size engine_copy.engine_size%TYPE;
BEGIN
    engine_id := 1;
    engine_type := 'disesel';
	engine_size := 3.0;
    FOR counter IN 1..10
        LOOP
            INSERT INTO engine_copy(engine_id, engine_type,engine_size)
            VALUES (counter + engine_id, engine_type,engine_size);
        END LOOP;
END;
$$