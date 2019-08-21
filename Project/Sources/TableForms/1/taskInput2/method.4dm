Case of 
	: (Form event:C388=On Load:K2:1) | (Form event:C388=On Bound Variable Change:K2:52)
		initializeTaskInputForm 
		
		If (Is new record:C668([Tasks:1]))
			SET WINDOW TITLE:C213(Get localized string:C991("New Task"))
		Else 
			SET WINDOW TITLE:C213(Get localized string:C991("Edit Task"))
		End if 
		
	: (Form event:C388=On Validate:K2:3)
		C_LONGINT:C283($count_l;$tableNumber_l)
		$tableNumber_l:=Table:C252(->[Tasks:1])
		Begin SQL
			select Count(*) from Category where Category.Name = :category_t and Category.CategoryTypeID = :$tableNumber_l
			into :$count_l;
		End SQL
		
		If ($count_l=0)
			CREATE RECORD:C68([Category:3])
			[Category:3]Name:2:=category_t
			[Category:3]CategoryTypeID:3:=$tableNumber_l
			SAVE RECORD:C53([Category:3])
			
			[Tasks:1]CategoryID:9:=[Category:3]ID:1
		End if 
		
		
End case 