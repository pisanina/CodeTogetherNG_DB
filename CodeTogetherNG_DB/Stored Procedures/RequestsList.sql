CREATE Procedure RequestsList @ProjectId int
	 AS
	 Select UserName, [Message], MemberId, Title, @ProjectId AS ProjectId,
	 FORMAT(MessageDate, 'dd/MM/yyyy') AS MessageDate, AddMember AS Accept
	 From ProjectMember
	 Join AspNetUsers On (ProjectMember.MemberId=AspNetUsers.Id)
	 Join Project On (ProjectMember.ProjectId=Project.ID)
	 Where ProjectId = @ProjectId

	 Go
     Grant EXECUTE ON RequestsList to codetogetherng
