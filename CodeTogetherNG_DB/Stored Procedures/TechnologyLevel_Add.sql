Create  Procedure [dbo].[TechnologyLevel_Add]  @UserName nvarchar(256), @TechnologyId int, @TechLevel int
AS
Declare @UserId nvarchar(450)
SET @UserId = (Select Id from AspNetUsers Where UserName = @UserName)
IF EXISTS(Select 1 From UserTechnologyLevel Where TechnologyId = @TechnologyId AND UserId= @UserId)
begin
 Update UserTechnologyLevel SET TechLevel = @TechLevel Where TechnologyId = @TechnologyId AND UserId= @UserId
end

else
begin
	Insert Into UserTechnologyLevel (UserId, TechnologyId, TechLevel) 
	Values (@UserId, @TechnologyId, @TechLevel)
end
Go
  Grant EXECUTE ON  TechnologyLevel_Add to codetogetherng  
