Create Procedure TechnologyLevel_Change @Id int, @TechLevel int
AS
Update UserTechnologyLevel 
SET TechLevel = @TechLevel
Where Id = @Id

Go
  Grant EXECUTE ON  TechnologyLevel_Change to codetogetherng  
