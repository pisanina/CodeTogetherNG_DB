CREATE TABLE [dbo].[ProjectTechnology] (
    [ProjectId]    INT NOT NULL,
    [TechnologyId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ProjectId] ASC, [TechnologyId] ASC),
    FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([ID]),
    FOREIGN KEY ([TechnologyId]) REFERENCES [dbo].[Technology] ([Id])
);

