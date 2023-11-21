def db_con():
    import mysql.connector
    mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='PDRK_Lion@123'
    )
    return mydb.is_connected()

