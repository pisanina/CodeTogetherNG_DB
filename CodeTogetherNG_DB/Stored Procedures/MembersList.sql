 Create Procedure MembersList @ProjectId int
   As
   Select UserName From AspNetUsers
   Join  ProjectMember On ProjectMember.MemberId = AspNetUsers.Id
   where ProjectId = @ProjectId And AddMember = 1

   Go
     Grant EXECUTE ON MembersList to codetogetherng
