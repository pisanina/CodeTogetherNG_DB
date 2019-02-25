CREATE VIEW [dbo].[Grid_View]  
AS   
Select ID, Title, Description = 
  Case
  When LEN(Description) > 50 then Substring(Description, 1, 50)+'...'
  else Description 
  END, CreationDate 
  From Project 
