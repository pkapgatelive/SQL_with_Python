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



mycursor.execute("select * from ineuron.fsds")

for i in mycursor:
    print(i)

# Only to get sepecific columns then 

mycursor.execute("select studentid, firstname, class from ineuron.fsds")

for i in mycursor:
    print(i)