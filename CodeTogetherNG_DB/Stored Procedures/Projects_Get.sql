CREATE PROCEDURE [dbo].[Projects_Get] 
AS
  Select Grid_View.ID, Title, [Description], TechName, TechnologyId
  From Grid_View
   Left Join ProjectTechnology On (Grid_View.ID=ProjectTechnology.ProjectId)
   Left Join Technology On (ProjectTechnology.TechnologyId=Technology.Id) 
   Order by CreationDate DESC;
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Projects_Get] TO [codetogetherng]
    AS [dbo];

