import csv
import decimal
import psycopg2

config = psycopg2.connect(database="Usatov_Lab2", user="Usatov", password="123", host="localhost", port="5432")

INPUT_CSV_FILE = 'X_train.csv'

query_0 = '''
CREATE TABLE Car_list
(
    car_id int,
    make character(50) NOT NULL,
    model character(50) NOT NULL,
    milage int
)
'''

query_1 = '''
DELETE FROM Car_list
'''

query_2 = '''
INSERT INTO Car_list (car_id,make,model,milage) VALUES (%s, %s, %s, %s)
'''

with config:
    cur = config.cursor()
    cur.execute(query_0)
    cur.execute(query_1)
    with open(INPUT_CSV_FILE, 'r') as info:
        reader = csv.DictReader(info)
        for idx, row in enumerate(reader):
            values = (row['carID'], row['brand'], row['model'], row['mileage'])
            cur.execute(query_2, values)

    config.commit()
