-- =============================================
-- Create basic stored procedure 
-- =============================================




-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N''
     AND SPECIFIC_NAME = N'' 
)
   DROP PROCEDURE <Schema_Name, sysname, Schema_Name>.<Procedure_Name, sysname, Procedure_Name>
GO

CREATE PROCEDURE <Schema_Name, sysname, Schema_Name>.<Procedure_Name, sysname, Procedure_Name>
	<@param1, sysname, @p1> <datatype_for_param1, , int> = <default_value_for_param1, , 0>, 
	<@param2, sysname, @p2> <datatype_for_param2, , int> = <default_value_for_param2, , 0>
AS
	SELECT @p1, @p2
GO

-- =============================================
-- Example to execute the stored procedure
-- =============================================
EXECUTE <Schema_Name, sysname, Schema_Name>.<Procedure_Name, sysname, Procedure_Name> <value_for_param1, , 1>, <value_for_param2, , 2>
GO


-- =============================================
-- Insert Values Into Table
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 05/22/2022
-- Description:	???
-- =============================================


USE [AdventureWorks2019]
GO

/****** Object:  Table [Practice_DB].[Job_Hunt]   Script Date: 5/22/2022 3:17:25 AM ******/

DECLARE  
@ROW_ID INT, 
@JOB_ID INT,
@COMPANY_ID TEXT,
@COMPANY_NAME TEXT, 
@APPLICATION_DT DATETIME,
@APPLICATION_METHOD TEXT,
@MODIFICATION_DT DATETIME;

SET 
@ROW_ID = :ROW_ID,
@JOB_ID = :JOB_ID,
@COMPANY_ID = :COMPANY_ID,
@COMPANY_NAME = :COMPANY_NAME,
@APPLICATION_DT =  :APPLICATION_DT,
@APPLICATION_METHOD = :APPLICATION_METHOD,
@MODIFICATION_DT =  :MODIFICATION_DT;
INSERT INTO [Practice_DB].[Job_Hunt]
(ROW_ID,
JOB_ID,
COMPANY_ID,
COMPANY_NAME,
APPLICATION_DT,
APPLICATION_METHOD,
MODIFICATION_DT)
VALUES
(@ROW_ID,
@JOB_ID,
@COMPANY_ID,
@COMPANY_NAME,
@APPLICATION_DT,
@APPLICATION_METHOD,
@MODIFICATION_DT);
GO


--Display the result set of the table variable.  
SELECT *  
FROM [Practice_DB].[Job_Hunt];  
GO  
