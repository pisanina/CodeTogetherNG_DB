CREATE Procedure GetListTechnologyLevel @UserName nvarchar(256)
AS
Declare @UserId nvarchar(450)
SET @UserId = (Select Id from AspNetUsers Where UserName = @UserName)

Select  UserTechnologyLevel.Id, TechName, TechLevel from UserTechnologyLevel 
Inner Join Technology ON UserTechnologyLevel.TechnologyId = Technology.Id
Where UserId= @UserId 

Go
  Grant EXECUTE ON  GetListTechnologyLevel to codetogetherng  
