-- =============================================
-- Create Table 
-- =============================================
USE [AdventureWorks2019]
GO

SET ANSI_NULL ON
GO

SET QUOTED_IDENTIFIER ON
GO

test 
-- Drop the table if it already exists
IF  OBJECT_ID([Practice_DB], 'U') IS NOT NULL
DROP TABLE [AdventureWorks2019].[Practice_DB]
GO

-- Create the table 
CREATE TABLE [AdventureWorks2019].[Practice_DB]
(
ROW_ID INT(20) ROWGUIDCOL NOT NULL,
JOB_ID INT(20) NOT NULl,
COMPANY_ID TEXT(50) NULL,
COMPAN_NAME TEXT(50) NOT NULL,
APPLICATION_DT DATETIME NOT NUll,
APPLICATION_METHOD TEXT(50) NULL,
MODIFICATION_DT TIMESTAMP NOT NULL,
CONSTRAINT PK_JOB_ID PRIMARY KEY NONCLUSTERED
(
	[ROW_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




USE [AdventureWorks2019]
GO

SELECT [DatabaseLogID]
      ,[PostTime]
      ,[DatabaseUser]
      ,[Event]
      ,[Schema]
      ,[Object]
      ,[TSQL]
      ,[XmlEvent]
  FROM [dbo].[DatabaseLog]

GO


