CREATE TABLE [dbo].[Project] (
    [ID]           INT                IDENTITY (1, 1) NOT NULL,
    [Title]        NVARCHAR (50)      NULL,
    [Description]  NVARCHAR (1000)    NULL,
    [CreationDate] DATETIMEOFFSET (7) CONSTRAINT [DF_Project_CreationDate] DEFAULT (sysdatetimeoffset()) NOT NULL,
    CONSTRAINT [PK_Project1] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [MinLength_Project_Description] CHECK (datalength([Description])>(19)),
    CONSTRAINT [MinLength_Project_Title] CHECK (datalength([Title])>(2)),
    CONSTRAINT [UC_Project_Title] UNIQUE NONCLUSTERED ([Title] ASC)
);

