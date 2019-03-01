CREATE PROC [dbo].[Project_Search] @ToFind Nvarchar(50), @TechList TechnologyList readonly
AS
Declare @TechCount int
set @TechCount = (select count(Id) from @TechList)

SELECT Grid_View.*, TechName, TechnologyId 
FROM Grid_View  
Left Join ProjectTechnology On (Grid_View.ID=ProjectTechnology.ProjectId)
Left Join Technology On (ProjectTechnology.TechnologyId=Technology.Id) 
WHERE (Title LIKE '%'+@ToFind+'%' OR [Description] LIKE '%'+@ToFind+'%')
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

