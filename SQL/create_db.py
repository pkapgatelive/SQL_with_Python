import mysql.connector
# import mysql.connector
#create user 'user'@'%' identified by 'password'
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="PDRK_Lion@123"
)
print(mydb)
mycursor = mydb.cursor()
mycursor.execute('create database ineuron')