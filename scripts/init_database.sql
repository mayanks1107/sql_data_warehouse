/*
    init_database.sql
    -----------------
    This script initializes the data warehouse environment in SQL Server.
    Steps performed:
    1. Switch to the master database.
    2. Check if the 'data_warehouse' database exists; if not, create it.
    3. Switch to the 'data_warehouse' database.
    4. Create the schemas 'bronze', 'silver', and 'gold' if they do not already exist

  Warning: Running this script will remove the current data_warehouse database. Run the commands with precaution.
*/

-- Switch to the master database
USE master;
GO

-- Check if the database 'data_warehouse' exists
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'data_warehouse')
BEGIN
    -- Create the database if it does not exist
    CREATE DATABASE data_warehouse;
END
GO

-- Switch to the data_warehouse database
USE data_warehouse;
GO

-- Create schemas if they do not exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze;');

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver;');

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold;');
GO
