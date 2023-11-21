import mysql.connector

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='PDRK_Lion@123'
    )

print(mydb.is_connected())

cur = mydb.cursor()


#cur.execute("show databases")

#for row in cur.fetchall():
#    print(row)

#cur.execute("create database test_data_science_db")

cur.execute("use Iris_database")

cur.execute("select * from iris_dataset")

for row in cur.fetchall():
    print(row)
