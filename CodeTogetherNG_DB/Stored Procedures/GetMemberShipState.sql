Create Procedure [dbo].[GetMemberShipState] @ProjectId int, @UserName nvarchar(450)
As
Declare @MemberId Nvarchar(450)
	Set @MemberId = (Select Id from AspNetUsers Where UserName = @UserName)
Select TOP(1) MessageDate, AddMember From ProjectMember
Where ProjectId= @ProjectId AND MemberID =@MemberId
order by MessageDate desc
GO
Grant EXECUTE ON GetMemberShipState to codetogetherng