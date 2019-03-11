Create Table ProjectMember
(Id int not null primary key identity(1,1), 
	ProjectId int FOREIGN KEY REFERENCES Project(ID) not null,
	MemberId Nvarchar(450) not null constraint FK_ProjectMember_AspNetUsers FOREIGN KEY REFERENCES AspNetUsers(id), 
	MessageDate datetimeOffset not null constraint DF_ProjectMember_MessageDate default  (sysdatetimeoffset()), 
	[Message] NVarchar(500) not null,
	AddMember bit );
