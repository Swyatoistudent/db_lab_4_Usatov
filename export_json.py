import json
import psycopg2

TABLES = [
    'car_list',
    'cars',
    'engine',
    'engine_copy',
    'lot',
]

config = psycopg2.connect(database="Usatov_Lab2", user="Usatov", password="123", host="localhost", port="5432")

data = {}
with config:

    cur = config.cursor()
    
    for table_name in TABLES:
        cur.execute('SELECT * FROM ' + table_name)
        rows = []
        fields = [x[0] for x in cur.description]

        for row in cur:
            rows.append(dict(zip(fields, row)))

        data[table_name] = rows

with open('Usatov.json', 'w') as output_f:
    json.dump(data, output_f, default = str)
    