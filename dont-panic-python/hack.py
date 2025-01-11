from cs50 import SQL

# Connect to the SQLite database
db = SQL("sqlite:///dont-panic.db")

# Define a query to select all details for the 'admin' user
query_admin = """
    SELECT "id", "username", "password"
    FROM "users"
    WHERE "username" = 'admin'
    """

# Execute the query and store the results
results = db.execute(query_admin)

# Print the first result
print(results[0])

# Prompt user to enter a new password for 'admin'
password = input("Enter a password: ")

# Update the 'admin' user's password in the database
# Pass the password as a parameter to prevent SQL injection
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)

# Re-execute the query to confirm the password update
results = db.execute(query_admin)

# Print the updated details of the 'admin' user
print(results[0])



'''
# SQLITE3 Demo

import sqlite3

# Connect to SQLite database (db file in the same location as this Python file)
connection = sqlite3.connect("dont-panic.db")

# Create a cursor object to execute SQL commands
cursor = connection.cursor()

# Print the number of changes made to the database since connection
print("Total changes:", connection.total_changes)

# Define a query to select all details for the 'admin' user
query_admin = """
    SELECT "id", "username", "password"
    FROM "users"
    WHERE "username" = 'admin';
    """

# Execute the query and fetch the first result
cursor.execute(query_admin)
results = cursor.fetchone()  # fetchone() since we expect a single user record

# Print the result for the 'admin' user
print(results)

# Prompt user to enter a new password for 'admin'
password = input("Enter a password: ")

# Update the 'admin' user's password in the database
# Use a parameterized query to prevent SQL injection
cursor.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    (password,)  # Single parameter tuple required in SQLite
)

# Commit the changes to save the password update
connection.commit()

# Re-execute the query to confirm the password update
cursor.execute(query_admin)
updated_results = cursor.fetchone()

# Print the updated details of the 'admin' user
print(updated_results)

# Close the connection
connection.close()
'''
