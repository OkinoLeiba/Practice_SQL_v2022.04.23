-- =============================================
-- Create database
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 5/22/2022 10:29 PM
-- Description:	The table created will assist user in tracking employment applications
-- =============================================
USE master
GO

-- Drop the database if it already exists
IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'OkinoPlayground'
)
DROP DATABASE [OkinoPlayground]
GO

CREATE DATABASE [OkinoPlayground] 
CONTAINMENT = NONE
ON PRIMARY
(
    NAME = N'OKL_PrimeGroup',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OKL_PrimeGroup.mdf',
    SIZE = 50MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 64MB
)
LOG ON 
(NAME = Archlog_OPlayground,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Archlog_OPlayground.ldf',
SIZE = 50MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 64MB)
COLLATE Latin1_General_CS_AS
--Consider default lang, containment config will need to be changed
--DEFAULT_LANGUAGE = 1033
WITH TRUSTWORTHY ON, DB_CHAINING ON;
GO





