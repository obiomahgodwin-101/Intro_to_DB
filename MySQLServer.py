import mysql.connector

try:
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="IS@bella19965"
    )
except mysql.connector.Error as e:
    print("Error while connecting to MySQL:", e)
else:
    try:
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as e:
        print("Error while creating database:", e)
    finally:
        cursor.close()
        connection.close()

