//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_LONGINT:C283($count_l;$tableNumber_l)
$tableNumber_l:=Table:C252($1)
Begin SQL
	select Count(*) from Category where Category.Name = :category_t and Category.CategoryTypeID = :$tableNumber_l
	into :$count_l;
End SQL

If ($count_l=0)
	CREATE RECORD:C68([Category:3])
	[Category:3]Name:2:=category_t
	[Category:3]CategoryTypeID:3:=$tableNumber_l
	SAVE RECORD:C53([Category:3])
	
	Case of 
		: (Table:C252(->[Tasks:1])=Table:C252($1))
			[Tasks:1]CategoryID:9:=[Category:3]ID:1
	End case 
	
End if 

If (categoryLB>1)
	Subform0:=Subform0+1
Else 
	Subform1:=Subform1+1
End if 