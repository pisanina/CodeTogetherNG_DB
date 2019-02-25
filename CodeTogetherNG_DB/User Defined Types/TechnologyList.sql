CREATE TYPE [dbo].[TechnologyList] AS TABLE (
    [id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC));


GO
GRANT EXECUTE
    ON TYPE::[dbo].[TechnologyList] TO [codetogetherng];

