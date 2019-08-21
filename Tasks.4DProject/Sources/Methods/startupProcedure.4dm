//%attributes = {"invisible":true}
If (Records in table:C83([Category:3])=0)
	
	C_LONGINT:C283($tableNumber_l)
	$tableNumber_l:=Table:C252(->[Tasks:1])
	
	CREATE RECORD:C68([Category:3])
	[Category:3]Name:2:="Work"
	[Category:3]CategoryTypeID:3:=$tableNumber_l
	SAVE RECORD:C53([Category:3])
	
	CREATE RECORD:C68([Category:3])
	[Category:3]Name:2:="Personal"
	[Category:3]CategoryTypeID:3:=$tableNumber_l
	SAVE RECORD:C53([Category:3])
	
	CREATE RECORD:C68([Category:3])
	[Category:3]Name:2:="Friends"
	[Category:3]CategoryTypeID:3:=$tableNumber_l
	SAVE RECORD:C53([Category:3])
	
End if 