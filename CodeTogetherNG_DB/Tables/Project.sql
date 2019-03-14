CREATE TABLE [dbo].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[CreationDate] [datetimeoffset](7) NOT NULL,
	[OwnerId] [nvarchar](450) NOT NULL,
	[NewMembers] [bit] NOT NULL Constraint DF_Project_NewMembers Default (0),
	[StateId] [int] Not Null Constraint DF_Project_ProjectStatus Default(1),
	[Deleted] [bit] NOT NULL CONSTRAINT DF_Project_Deleted DEFAULT (0),


 CONSTRAINT [PK_Project1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Project_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_CreationDate]  DEFAULT (sysdatetimeoffset()) FOR [CreationDate]
GO

ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_UserProject] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_ProjectState] FOREIGN KEY([StateId])
REFERENCES [dbo].[ProjectState] ([Id])
GO

ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_UserProject]
GO

ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [MinLength_Project_Description] CHECK  ((datalength([Description])>(19)))
GO

ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [MinLength_Project_Description]
GO

ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [MinLength_Project_Title] CHECK  ((datalength([Title])>(2)))
GO

ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [MinLength_Project_Title]

