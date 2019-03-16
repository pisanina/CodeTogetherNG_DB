Create Procedure Users_List
AS
Select UserName From AspNetUsers

GO
  Grant EXECUTE ON Users_List to codetogetherng 
