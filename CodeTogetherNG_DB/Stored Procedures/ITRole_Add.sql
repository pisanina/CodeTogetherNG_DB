 Create Procedure [dbo].[ITRole_Add]  @UserName nvarchar(256), @RoleId int
AS
Declare @UserId nvarchar(450)
SET @UserId = (Select Id from AspNetUsers Where UserName = @UserName)

	Insert Into UserITRole (UserId, RoleId) 
	Values (@UserId, @RoleId)

	Go
Grant EXECUTE ON ITRole_Add to codetogetherng  
