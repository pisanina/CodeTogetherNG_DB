Create Procedure GetUserITRoles @UserName nvarchar(256)
AS
Declare @UserId nvarchar(450)
SET @UserId = (Select Id from AspNetUsers Where UserName = @UserName)

Select  Id, [Role] from UserITRole
Inner Join ITRole ON UserITRole.RoleID = ITRole.Id
Where UserID= @UserId 
Go
Grant EXECUTE ON GetUserITRoles to codetogetherng  	
