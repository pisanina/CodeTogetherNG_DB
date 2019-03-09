Create Procedure ProjectMember_NewRequest  
@ProjectId int, @MemberId Nvarchar(450), @Message nvarchar(500) 
AS
Insert Into ProjectMember (ProjectId, MemberId, [Message]) values (@ProjectId, @MemberId, @Message);

Go
Grant EXECUTE ON ProjectMember_NewRequest to codetogetherng
