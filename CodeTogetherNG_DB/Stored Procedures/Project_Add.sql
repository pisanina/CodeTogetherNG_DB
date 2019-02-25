 CREATE PROCEDURE [dbo].[Project_Add] @Title Nvarchar(50), @Description Nvarchar(1000),
 @TechList TechnologyList readonly
  AS
    IF Exists (Select 1 from @TechList)
    begin
		begin Try
			 BEGIN TRANSACTION
				Insert into Project (Title, Description) Values ( @Title,  @Description);
  
				Insert into ProjectTechnology (ProjectId, TechnologyId) Select SCOPE_IDENTITY(), Id from @TechList
			COMMIT TRANSACTION
		end Try
 	begin Catch
		ROLLBACK Transaction
		throw
	end Catch
  end
  ELSE 
  Insert into Project (Title, Description) Values ( @Title,  @Description)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Project_Add] TO [codetogetherng]
    AS [dbo];

