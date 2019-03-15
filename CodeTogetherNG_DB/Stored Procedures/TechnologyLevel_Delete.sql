Create Procedure TechnologyLevel_Delete @Id int
AS
Delete From UserTechnologyLevel 
Where Id = @Id

Go
  Grant EXECUTE ON  TechnologyLevel_Delete to codetogetherng  
