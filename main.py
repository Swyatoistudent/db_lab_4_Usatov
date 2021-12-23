import matplotlib.pyplot as plt
import psycopg2
import pandas as pd

config = psycopg2.connect(database="Usatov_Lab2", user="Usatov", password="123", host="localhost", port="5432")

querry_selector_1 = """ create view MilesByMake as
SELECT ROUND(AVG(mileage), 2) as avg_miles, make 
FROM Cars
GROUP BY make
ORDER BY avg_miles"""

querry_selector_2 = """create view CarsByEngine as
SELECT COUNT(engine_id) as amount, engine
FROM Cars INNER JOIN Engine USING(engine_id)
GROUP BY engine
ORDER BY amount"""

querry_selector_3 = """create view PriceByMake as
SELECT AVG(price) as amount, make 
FROM Lot INNER JOIN Cars USING(car_id)
GROUP BY make"""

with config:
    cur = config.cursor()
    cur.execute('DROP VIEW IF EXISTS MilesByMake')
    cur.execute(querry_selector_1)
    cur.execute('SELECT * FROM MilesByMake')

    column_x = []
    column_y = []
    pd_data_1 = []
    for line in cur:
        column_x.append(line[1])
        column_y.append(line[0])
        pd_data_1.append([line[0], line[1].replace(' ', '')])
    for i in range(len(column_x)):
        column_x[i] = column_x[i].replace(' ', '')

    fig1, ax1 = plt.subplots(figsize=(8, 8))
    ax1.bar(column_x, column_y, width=0.5)
    plt.title('Стовпчикова діаграма\nПробіг серед марок')
    plt.xlabel('Марка')
    plt.ylabel('Середній пробіг')
    pd_df_1 = pd.DataFrame(columns=['avg_miles', 'make'], data=pd_data_1, index=range(1,len(pd_data_1)+1))
    plt.show()

    cur.execute('DROP VIEW IF EXISTS CarsByEngine')
    cur.execute(querry_selector_2)
    cur.execute('SELECT * FROM CarsByEngine')

    pie_names = []
    pie_temp_values = []
    pie_values = []
    pd_data_2 = []
    for line in cur:
        pie_names.append(line[1][3:-1])
        pie_temp_values.append(line[0])
        pd_data_2.append([line[0], line[1].replace(' ', '')])
    for i in range(len(pie_names)):
        pie_names[i] = pie_names[i].replace(' ', '')
    for i in range(len(pie_temp_values)):
        pie_values.append(pie_temp_values[i] / sum(pie_temp_values) * 100)

    fig2, ax2 = plt.subplots(figsize=(8, 8))
    ax2.pie(pie_values, labels=pie_names, autopct='%1.0f%%', shadow=True, startangle=90)
    ax2.axis('equal')
    plt.title('Кругова діаграма')
    pd_df_2 = pd.DataFrame(columns=['amount', 'engine'], data=pd_data_2, index=range(1,len(pd_data_2)+1))
    plt.show()

    cur.execute('DROP VIEW IF EXISTS PriceByMake')
    cur.execute(querry_selector_3)
    cur.execute('SELECT * FROM PriceByMake')

    column_x = []
    column_y = []
    pd_data_3 = []
    for line in cur:
        column_x.append(line[1])
        column_y.append(line[0])
        pd_data_3.append([line[0], line[1]])

    fig3, ax3 = plt.subplots(figsize=(8, 8))
    ax3.plot(column_x, column_y)
    plt.title('Графік залежності')
    plt.xlabel('Марка')
    plt.ylabel('Середня ціна')
    pd_df_3 = pd.DataFrame(columns=['amount', 'make'], data=pd_data_3, index=range(1,len(pd_data_3)+1))
    plt.show()

    print("\nЗапит 1(стовпчикова діаграма)\n")
    print(pd_df_1.to_markdown(index=False))
    print("\nЗапит 2(кругова діаграма)\n")
    print(pd_df_2.to_markdown(index=False))
    print("\nЗапит 3(графік залежності)\n")
    print(pd_df_3.to_markdown(index=False))