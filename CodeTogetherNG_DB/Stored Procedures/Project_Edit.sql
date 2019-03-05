 Create PROCEDURE [dbo].[Project_Edit] @Id int, @Title Nvarchar(50), @Description Nvarchar(1000),
 @TechList TechnologyList readonly, @NewMembers bit
 AS
  begin
		begin Try
			 BEGIN TRANSACTION
				Update Project SET Title = @Title, Description = @Description, 
						NewMembers = @NewMembers
						where Id=@Id
				Delete From ProjectTechnology where ProjectId = @Id
				Insert Into ProjectTechnology (ProjectId, TechnologyId) Select @Id, Id from @TechList
			COMMIT TRANSACTION
		end Try
 	begin Catch
		ROLLBACK Transaction
		throw
	end Catch
  end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Project_Edit] TO [codetogetherng]
    AS [dbo];