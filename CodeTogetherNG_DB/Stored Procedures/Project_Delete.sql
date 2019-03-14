Create Procedure Project_Delete @ProjectId int
AS
Update Project SET Deleted = 1 
Where Id = @ProjectId

GO
 Grant EXECUTE ON Project_Delete to codetogetherng  