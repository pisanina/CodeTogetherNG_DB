Create Table UserTechnologyLevel 
(Id int not null identity (1,1)
, UserId nvarchar(450) constraint FK_UserTechnologyLevel_AspNetUsers FOREIGN KEY REFERENCES AspNetUsers(id)
, TechnologyId int constraint FK_UserTechnologyLevel_Technology FOREIGN KEY REFERENCES Technology(id)
, TechLevel int not null
, CONSTRAINT UC_UserTechnologyLevel_UserId_TechnologyId UNIQUE (UserId, TechnologyId))
