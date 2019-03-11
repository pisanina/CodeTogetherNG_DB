 Create Procedure AcceptMember @ProjectId int, @MemberId nvarchar(450), @Accept bit
	 AS 
	 Update ProjectMember 
	 SET AddMember = @Accept
	 where (ProjectId = @ProjectId AND MemberId = @MemberId)

	 GO
	 Grant EXECUTE ON AcceptMember to codetogetherng
