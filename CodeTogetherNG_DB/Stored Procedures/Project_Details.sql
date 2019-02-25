CREATE Procedure [dbo].[Project_Details] @FindId Int
  AS
  Select Project.ID, Title, [Description], FORMAT(CreationDate, 'dd/MM/yyyy') AS CreationDate, TechName, TechnologyId
  From Project
   Left Join ProjectTechnology On (Project.ID=ProjectTechnology.ProjectId)
   Left Join Technology On (ProjectTechnology.TechnologyId=Technology.Id) 
   Where Project.ID = @FindId 
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Project_Details] TO [codetogetherng]
    AS [dbo];

