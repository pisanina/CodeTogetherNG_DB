Create Procedure GetMemberShipState @ProjectId int, @UserName nvarchar(450)
As
Declare @MemberId Nvarchar(450)
	Set @MemberId = (Select Id from AspNetUsers Where UserName = @UserName)
Select MessageDate, AddMember From ProjectMember
Where ProjectId= @ProjectId AND MemberID =@MemberId

GO
Grant EXECUTE ON GetMemberShipState to codetogetherng