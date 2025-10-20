import mysql.connector
from mysql.connector import Error

try:
    # Establish connection to MySQL server
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='IS@bella19965'
    )

    if connection.is_connected():
        cursor = connection.cursor()

        # Create database if not exists
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully!")

except Error as e:
    print("Error while connecting to MySQL:", e)

finally:
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()
