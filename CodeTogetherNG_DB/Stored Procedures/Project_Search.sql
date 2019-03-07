CREATE PROC [dbo].[Project_Search] @ToFind Nvarchar(50), @TechList TechnologyList readonly, 
@NewMembers bit, @StateId int
AS
Declare @TechCount int
set @TechCount = (select count(Id) from @TechList)

SELECT Grid_View.*, TechName, TechnologyId 
FROM Grid_View  
Left Join ProjectTechnology On (Grid_View.ID=ProjectTechnology.ProjectId)
Left Join Technology On (ProjectTechnology.TechnologyId=Technology.Id) 
WHERE (@ToFind IS NULL OR Title LIKE '%'+@ToFind+'%' OR [Description] LIKE '%'+@ToFind+'%') 
AND (@NewMembers IS Null OR NewMembers=@NewMembers)
AND (@StateId IS Null OR StateId=@StateId)
AND
(@TechCount=0 OR
 ProjectTechnology.ProjectId IN (Select ProjectId from ProjectTechnology 
  where TechnologyId in (Select Id from @TechList) 
  group by ProjectId  
  having Count(ProjectId) = @TechCount))
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Project_Search] TO [codetogetherng]
    AS [dbo];

