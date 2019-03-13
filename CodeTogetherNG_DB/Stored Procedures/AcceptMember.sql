 Create Procedure [dbo].[AcceptMember] @Id int, @Accept bit
	 AS 
	 Update ProjectMember 
	 SET AddMember = @Accept
	 where (Id = @Id )

	 GO
	 Grant EXECUTE ON AcceptMember to codetogetherng
