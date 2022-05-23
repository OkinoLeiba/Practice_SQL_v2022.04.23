-- =============================================
-- Create Table 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 05/22/2022
-- Description:	The table created will assist user in tracking employment applications
-- =============================================
USE [OkinoPlayground]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--Create the schema
CREATE SCHEMA [Practice_Schema] AUTHORIZATION dbo;
GO

   
-- Drop the table if it already exists
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Practice_Schema].[Job_Hunt]', N'U'))
DROP TABLE [Practice_Schema].[Job_Hunt]
GO


-- Create the table 
CREATE TABLE [Practice_Schema].[Job_Hunt]
(
ROW_ID UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
COMPANY_ID INT UNIQUE NULL,
COMPANY_NAME TEXT NOT NULL,
APPLICATION_DT DATETIME NOT NUll,
APPLICATION_METHOD TEXT NULL,
MODIFICATION_DT DATETIME NOT NULL,
CONSTRAINT PK_JOB_ID PRIMARY KEY NONCLUSTERED 
(
	[ROW_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = NONE) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [Practice_Schema].[Job_Hunt] ADD CONSTRAINT [DF_MODIFICATION_DT]  DEFAULT (getdate()) FOR [MODIFICATION_DT]
GO

ALTER TABLE [Practice_Schema].[Job_Hunt] WITH CHECK ADD CONSTRAINT [CK_COMPANY_ID] CHECK (COMPANY_ID LIKE '%[^0-9]%')
GO

ALTER TABLE [Practice_Schema].[Job_Hunt] CHECK CONSTRAINT [CK_COMPANY_ID]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identification of each row.' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'COLUMN',@level2name=N'ROW_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identification of each company.' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'COLUMN',@level2name=N'COMPANY_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of company associated with application.' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'COLUMN',@level2name=N'COMPANY_NAME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date of application.' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'COLUMN',@level2name=N'APPLICATION_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Method of application.' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'COLUMN',@level2name=N'APPLICATION_METHOD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date modification of application.' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'COLUMN',@level2name=N'MODIFICATION_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'CONSTRAINT',@level2name=N'DF_MODIFICATION_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (nonclustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'CONSTRAINT',@level2name=N'PK_JOB_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint COMPANY_ID LIKE [0-9]*' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt', @level2type=N'CONSTRAINT',@level2name=N'CK_COMPANY_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup table containing the languages in which some AdventureWorks data is stored.' , @level0type=N'SCHEMA',@level0name=N'Practice_Schema', @level1type=N'TABLE',@level1name=N'Job_Hunt'
GO


--Confirm creation of schema and table 
SELECT * FROM Practice_Schema.Job_Hunt
GO


--Test the insertion of data
INSERT INTO [Practice_Schema].[Job_Hunt]
(ROW_ID, 
COMPANY_ID,
COMPANY_NAME,
APPLICATION_DT,
APPLICATION_METHOD,
MODIFICATION_DT)
VALUES (NEWID(), 666, 'Amazon', 05/22/2022, 'Online', 05/22/2022);

--Empty table after test 
TRUNCATE TABLE [Practice_Schema].[Job_Hunt];  
GO  

--Drop table
DROP TABLE [Practice_Schema].[Job_Hunt];
