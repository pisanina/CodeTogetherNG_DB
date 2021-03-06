﻿CREATE Procedure [dbo].[Project_Details] @FindId Int
  AS
  Select Project.ID, Title, [Description], UserName, NewMembers, 
  FORMAT(CreationDate, 'dd/MM/yyyy') AS CreationDate, TechName, TechnologyId, StateId
  From Project
   Left Join ProjectTechnology On (Project.ID=ProjectTechnology.ProjectId)
   Left Join Technology On (ProjectTechnology.TechnologyId=Technology.Id) 
   Join AspNetUsers On (AspNetUsers.Id=Project.OwnerId)
   Where Project.ID = @FindId AND Project.Deleted = 0
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Project_Details] TO [codetogetherng]
    AS [dbo];

