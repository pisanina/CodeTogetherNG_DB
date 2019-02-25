Create PROCEDURE Logs_Add @ErrorMessage Nvarchar(Max)
  AS
  Insert into Logs (ErrorMessage) Values (@ErrorMessage)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Logs_Add] TO [codetogetherng]
    AS [dbo];

