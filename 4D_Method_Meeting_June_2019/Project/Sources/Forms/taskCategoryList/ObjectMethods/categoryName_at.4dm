
OBJECT SET ENTERABLE:C238(*;"categoryName_at";False:C215)

QUERY:C277([Category:3];[Category:3]ID:1=categoryID_al{categoryName_at})
If (categoryName_at{categoryName_at}="")
	DELETE RECORD:C58([Category:3])
Else 
	[Category:3]Name:2:=categoryName_at{categoryName_at}
	SAVE RECORD:C53([Category:3])
End if 

loadTaskCategorySelection 