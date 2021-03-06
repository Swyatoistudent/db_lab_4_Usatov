

CREATE TABLE Engine
(
  engine_id    int        NOT NULL ,
  engine_type  char(20)   NOT NULL,
  engine_size  float   NOT NULL
);

-- Create Cars table

CREATE TABLE Cars
(
  car_id       int        NOT NULL ,
  make         char(20)   NOT NULL ,
  model        char(20)   NOT NULL ,
  mileage      int        NOT NULL ,
  engine_id    int        NOT NULL
);

-- Create Orders table

CREATE TABLE Lot
(
  lot_id     int        NOT NULL ,
  car_id     int        NOT NULL ,
  price      int        NOT NULL
);

-- Define primary keys

ALTER TABLE Engine ADD CONSTRAINT PK_Engine PRIMARY KEY (engine_id);
ALTER TABLE Cars ADD CONSTRAINT PK_Cars PRIMARY KEY (car_id);
ALTER TABLE Lot ADD CONSTRAINT PK_Lot PRIMARY KEY (lot_id);

-- Define foreign keys

ALTER TABLE Cars
ADD CONSTRAINT FK_Cars_Engine FOREIGN KEY (engine_id) REFERENCES Engine(engine_id);
ALTER TABLE Lot
ADD CONSTRAINT FK_Lot_Cars FOREIGN KEY (car_id) REFERENCES Cars(car_id);
