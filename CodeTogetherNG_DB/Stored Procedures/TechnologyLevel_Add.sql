Create Procedure TechnologyLevel_Add  @UserName nvarchar(256), @TechnologyId int, @TechLevel int
AS
Declare @UserId nvarchar(450)
SET @UserId = (Select Id from AspNetUsers Where UserName = @UserName)
Insert Into UserTechnologyLevel (UserId, TechnologyId, TechLevel) 
Values (@UserId, @TechnologyId, @TechLevel)
Go
  Grant EXECUTE ON  TechnologyLevel_Add to codetogetherng  
