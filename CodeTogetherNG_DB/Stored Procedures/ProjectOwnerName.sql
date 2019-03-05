  Create Procedure ProjectOwnerName @Id int
  AS
  Select UserName From AspNetUsers inner Join Project On AspNetUsers.Id = Project.OwnerId  where Project.ID=@Id

  Go
  Grant EXECUTE ON ProjectOwnerName to codetogetherng
