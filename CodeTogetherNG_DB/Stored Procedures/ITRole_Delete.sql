Create Procedure [dbo].[ITRole_Delete]  @UserName nvarchar(256), @RoleId int
AS
Declare @UserId nvarchar(450)
SET @UserId = (Select Id from AspNetUsers Where UserName = @UserName)

Delete From UserItRole where UserId = @UserId AND RoleId = @RoleId
Go
Grant EXECUTE ON ITRole_Delete to codetogetherng  	