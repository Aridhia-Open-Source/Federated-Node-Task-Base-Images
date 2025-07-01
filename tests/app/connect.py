import os
import pyodbc

conn_string = f"driver={{PostgreSQL ANSI}};Uid={os.getenv("USER")};Pwd={os.getenv("PASSWORD")};Server={os.getenv("HOST")},{os.getenv("PORT")};Database={os.getenv("DATABASE")}"
print(f"using {conn_string}")
cnxn = pyodbc.connect(conn_string)
cursor = cnxn.cursor()

print("Connection successful!")
cursor.execute("CREATE TABLE IF NOT EXISTS test (id int CONSTRAINT pk PRIMARY KEY);")
cursor.execute("INSERT INTO test VALUES ('100') ON CONFLICT DO NOTHING;")
cursor.execute("SELECT * FROM test;")

for row in cursor.fetchall():
    print(row)
cnxn.close()
