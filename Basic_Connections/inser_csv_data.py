import pandas as pd
import mysql as mysql
from database_connection import db_con
df = pd.read_csv("iris.csv")
print
# Connect to the MySQL database
try:
    connection = db_con()
    cursor = connection.cursor()
    cursor.execute("use Iris_Database")

    # Create the table in the database (if it doesn't exist)
    create_table_query = """
    CREATE TABLE IF NOT EXISTS iris_dataset (
        Id INT PRIMARY KEY,
        SepalLengthCm FLOAT,
        SepalWidthCm FLOAT,
        PetalLengthCm FLOAT,
        PetalWidthCm FLOAT,
        Species VARCHAR(255)
    );
    """
    cursor.execute(create_table_query)
    check_primary_data = f"select id from iris_dataset where id = {df.Id.iloc[0]}"

    if cursor.execute(check_primary_data) is not None:
        print(f"Data already exists in the table.")
    else:
        print(f"Data does not exist in the table.")
        # Insert data into the table
        insert_query = "INSERT INTO iris_dataset (Id, SepalLengthCm, SepalWidthCm, PetalLengthCm, PetalWidthCm, Species) VALUES (%s, %s, %s, %s, %s, %s);"
        data_to_insert = [tuple(row) for row in df.values]
        cursor.executemany(insert_query, data_to_insert)

        # Commit the changes
        connection.commit()
        print(f"Data inserted into the table successfully.")
    cursor.execute("select * from iris_dataset")
    for row in cursor:
        print(row)

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
