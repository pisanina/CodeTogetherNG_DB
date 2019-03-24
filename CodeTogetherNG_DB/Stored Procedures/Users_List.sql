Create Procedure Users_List
AS
SELECT AllUsers.UserName, IsNull(OwnerOf, 0) AS OwnerOf, IsNull(MemberOf,0) As MemberOf, 
		IsNULL(BeginnerIn, 0) AS BeginnerIn, IsNull(AdvancedIn, 0) AS AdvancedIn, IsNull(ExpertIn,0 ) AS ExpertIn FROM 
( Select UserName From AspNetUsers ) As AllUsers
	Left Join
	(
		Select UserName, Count(OwnerId) AS OwnerOf 
			From AspNetUsers
				Join Project On AspNetUsers.Id = Project.OwnerId Group by UserName
	) AS OwnerCount ON AllUsers.UserName = OwnerCount.UserName
	Left Join
	(
		Select UserName, Count(case when addmember=1 then 1 else NULL end) AS MemberOf
			From AspNetUsers 
				Join ProjectMember On AspNetUsers.Id = ProjectMember.MemberId
			Group By UserName
	) As MemberCount On OwnerCount.UserName = MemberCount.UserName
	Left Join 
	(
		Select UserName
			, Count(case when TechLevel=1 then 1 else Null end) AS BeginnerIn
			, Count(case when TechLevel=2 then 1 else Null end) AS AdvancedIn
			, Count(case when TechLevel=3 then 1 else Null end) AS ExpertIn
			From AspNetUsers
				Left Join UserTechnologyLevel ON AspNetUsers.Id = UserTechnologyLevel.UserId
			Group by UserName 
	) AS skillLevels ON  OwnerCount.UserName=skillLevels.UserName 

GO
  Grant EXECUTE ON Users_List to codetogetherng 
