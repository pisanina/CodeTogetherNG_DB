Create Procedure ITRole_List
  As
  Select Id, [Role] From ITRole
  Go
Grant EXECUTE ON ITRole_List to codetogetherng  
