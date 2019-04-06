Create Table UserITRole (
  UserID nvarchar(450) not null, 
  RoleID int not null,
  Constraint [FK_UserITRole_AspNetUsers] Foreign key (UserID) References AspNetUsers(Id),
  Constraint [FK_UserITRole_ITRole] Foreign key (RoleID) References ITRole(Id),
  Constraint [UC_UserITRole_UserID_RoleID] UNIQUE (UserID, RoleId)
  )
