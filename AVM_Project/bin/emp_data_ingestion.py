import sys
import os
import pandas as pd
import snowflake.connector
import logging

# Configure logging
logging.basicConfig(filename='logs/emp_data_ingestion.log', level=logging.INFO, format='%(asctime)s - %(levelname)s: %(message)s')

# Snowflake connection parameters
snowflake_params = {
    'user': 'NIKHIL07',
    'password': 'Nikhil.1@',
    'account': 'mbcdvuu-ud48515',
    'warehouse': 'COMPUTE_WH',
    'database': 'P01_EMP',
    'schema': 'EMP_RAW'
}

def ingest_data(file_path, table_name):
    try:
        # Read data from file into DataFrame
        df = pd.read_csv(file_path, sep='|', header=None, dtype=str)
        
        # Replace NaN with None for SQL compatibility
        df = df.where(pd.notnull(df), None)

        logging.info("DataFrame Head:")
        logging.info(df.head())

        # Connect to Snowflake
        conn = snowflake.connector.connect(**snowflake_params)
        cur = conn.cursor()

        # Create table if it doesn't exist (adjust data types as needed)
        column_definitions = ', '.join([f'COL{i} STRING' for i in range(df.shape[1])])
        cur.execute(f"CREATE TABLE IF NOT EXISTS {table_name} ({column_definitions})")

        # Ingest data into Snowflake table
        placeholders = ','.join(['%s'] * df.shape[1])
        cur.executemany(f"INSERT INTO {table_name} VALUES ({placeholders})", df.values.tolist())
        conn.commit()
        
        logging.info("Data ingestion successful!")

    except Exception as e:
        logging.error(f"Error ingesting data into {table_name}: {e}")

    finally:
        cur.close()
        conn.close()
        logging.info("Snowflake connection closed.")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python emp_data_ingestion.py <file_path> <table_name>")
        sys.exit(1)

    file_path = sys.argv[1]
    table_name = sys.argv[2]

    # Check if the file exists
    if not os.path.exists(file_path):
        logging.error(f"File '{file_path}' does not exist.")
        sys.exit(1)

    ingest_data(file_path, table_name)
