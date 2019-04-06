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

IF ((select Count(Id) from ITRole) = 0)
begin
Insert INTO ITRole Values ('Automation Tester'),('Back-end Developer'),
  ('Business Analyst'), ('Configuration Engineer'), ('DBA'), ('Delivery Manager'), 
  ('Full-stack developer'), ('Front-end Developer'), ('Incident Manager'), 
  ('Infrastructure Engineer'), ('Project Owner'), ('Release Manager'), 
  ('Solution Architect'), ('Tester'),('Technical Architect');
end
