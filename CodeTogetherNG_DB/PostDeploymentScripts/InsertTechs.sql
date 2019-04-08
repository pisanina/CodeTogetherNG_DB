/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF ((select Count(Id) from Technology) = 0)
begin
Insert INTO Technology 
Values ('Angular'),('Assembly'),
  ('C'), ('C++'), ('C#'), ('Java'), 
  ('JavaScript'), ('jQuery'), ('Laravel'), 
  ('.NET'), ('.NetCore'), ('Node JS'), 
  ('Objective-C'), ('Python'), ('Pl/SQL'),
  ('React'), ('Swift'),('Visual Basic');
end