CREATE Procedure GetProjectTitleForUser @UserName nvarchar(256)
 AS
 Declare @UserId nvarchar(450)
SET @UserId = (Select Id from AspNetUsers Where UserName = @UserName)
  Select ID, Title from Project Where ID In
 ( Select ID from Project 
  where OwnerId = @UserId
  Union
  Select ProjectId from ProjectMember
  where MemberId = @UserId AND ADDMember=1)

  Go 
   Grant EXECUTE ON GetProjectTitleForUser to codetogetherng  
 
