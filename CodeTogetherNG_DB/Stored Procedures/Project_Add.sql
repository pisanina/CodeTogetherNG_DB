
 Create PROCEDURE [dbo].[Project_Add] @Title Nvarchar(50), @Description Nvarchar(1000),
 @TechList TechnologyList readonly, @UserName Nvarchar(256)
  AS
	Declare @UserId Nvarchar(450)
	Set @UserId = (Select Id from AspNetUsers Where UserName = @UserName)
    IF Exists (Select 1 from @TechList)
    begin
		begin Try
			 BEGIN TRANSACTION
				Insert into Project (Title, Description, OwnerId) Values ( @Title,  @Description, @UserId);
  
				Insert into ProjectTechnology (ProjectId, TechnologyId) Select SCOPE_IDENTITY(), Id from @TechList
			COMMIT TRANSACTION
		end Try
 	begin Catch
		ROLLBACK Transaction
		throw
	end Catch
  end
  ELSE 
  Insert into Project (Title, Description, OwnerId) Values ( @Title,  @Description, @UserId)
GO

GRANT EXECUTE
    ON OBJECT::[dbo].[Project_Add] TO [codetogetherng]
GO

