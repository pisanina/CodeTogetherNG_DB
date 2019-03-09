Create Procedure ProjectMember_NewRequest  @ProjectId int, @UserName Nvarchar(256), @Message nvarchar(500) 
	AS
	Declare @MemberId Nvarchar(450)
	Set @MemberId = (Select Id from AspNetUsers Where UserName = @UserName)
	Insert Into ProjectMember (ProjectId, MemberId, [Message]) values (@ProjectId, @MemberId, @Message);

Go
Grant EXECUTE ON ProjectMember_NewRequest to codetogetherng
