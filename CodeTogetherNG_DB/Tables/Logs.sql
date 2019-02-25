CREATE TABLE [dbo].[Logs] (
    [ID]           INT                IDENTITY (1, 1) NOT NULL,
    [Date]         DATETIMEOFFSET (7) CONSTRAINT [DF_Logs_Date] DEFAULT (sysdatetimeoffset()) NOT NULL,
    [ErrorMessage] NVARCHAR (MAX)     NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

