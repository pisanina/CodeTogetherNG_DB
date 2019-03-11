Create Procedure RequestsCount @ProjectId int
As
Select count(ProjectId) from ProjectMember where ProjectId = @ProjectId;

Go
Grant EXECUTE ON RequestsCount to codetogetherng
