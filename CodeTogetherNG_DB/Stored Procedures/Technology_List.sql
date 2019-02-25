CREATE Procedure [dbo].[Technology_List]
  AS
  Select Id, TechName from Technology
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Technology_List] TO [codetogetherng]
    AS [dbo];

