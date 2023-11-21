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

cur.execute("use test_data_science_db")

cur.execute("create table test1 (name varchar(40), roll_no int, mail_id varchar(50))")

