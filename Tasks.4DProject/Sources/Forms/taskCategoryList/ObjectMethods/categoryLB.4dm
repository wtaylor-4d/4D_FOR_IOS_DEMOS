Case of 
	: (Form event:C388=On Selection Change:K2:29)
		loadTaskCategorySelection 
		
	: (Form event:C388=On Getting Focus:K2:7)
		categoryNav_apic{categoryLB}:=rightArrow_pic
		
	: (Form event:C388=On Losing Focus:K2:8)
		
		categoryNav_apic{categoryLB}:=rightArrow_d_pic
		If (categoryName_at{categoryLB}="")
			QUERY:C277([Category:3];[Category:3]ID:1=categoryID_al{categoryLB})
			DELETE RECORD:C58([Category:3])
			If (OK=1)
				LISTBOX DELETE ROWS:C914(*;"categoryLB";categoryLB;1)
				If (categoryLB>Size of array:C274(categoryLB))
					categoryLB:=Size of array:C274(categoryLB)
				End if 
			End if 
		End if 
		
	: (Form event:C388=On Clicked:K2:4)
		If (Contextual click:C713)
			C_LONGINT:C283($sel_l;$pos_l)
			C_TEXT:C284($menu_t)
			$menu_t:=Create menu:C408
			APPEND MENU ITEM:C411($menu_t;":xliff:New")
			SET MENU ITEM PARAMETER:C1004($menu_t;-1;"New")
			APPEND MENU ITEM:C411($menu_t;"-")
			APPEND MENU ITEM:C411($menu_t;":xliff:Rename")
			SET MENU ITEM PARAMETER:C1004($menu_t;-1;"Rename")
			APPEND MENU ITEM:C411($menu_t;":xliff:Delete")
			SET MENU ITEM PARAMETER:C1004($menu_t;-1;"Delete")
			
			If (categoryLB<2)
				DISABLE MENU ITEM:C150($menu_t;-1)
			End if 
			
			  //If (categoryLB>1)
			  //$sel_l:=Pop up menu("New;-);Rename;Delete")
			  //Else 
			  //$sel_l:=Pop up menu("New;-);(Rename;(Delete")
			  //End if 
			
			C_TEXT:C284($sel_t)
			$sel_t:=Dynamic pop up menu:C1006($menu_t)
			
			RELEASE MENU:C978($menu_t)
			
			Case of 
				: ($sel_t="New")  // New
					CREATE RECORD:C68([Category:3])
					[Category:3]CategoryTypeID:3:=Table:C252(->[Tasks:1])
					[Category:3]Name:2:=Get localized string:C991("Untitled")
					SAVE RECORD:C53([Category:3])
					$pos_l:=Size of array:C274(categoryLB)+1
					LISTBOX INSERT ROWS:C913(*;"categoryLB";$pos_l;1)
					categoryID_al{$pos_l}:=[Category:3]ID:1
					categoryName_at{$pos_l}:=[Category:3]Name:2
					
					GOTO OBJECT:C206(*;"categoryName_at")
					OBJECT SET ENTERABLE:C238(*;"categoryName_at";True:C214)
					EDIT ITEM:C870(*;"categoryName_at";$pos_l)
					
					categoryLB:=$pos_l
				: ($sel_t="Rename")  // Rename
					OBJECT SET ENTERABLE:C238(*;"categoryName_at";True:C214)
					EDIT ITEM:C870(*;"categoryName_at";categoryName_at)
					
				: ($sel_t="Delete")  // Delete
					QUERY:C277([Category:3];[Category:3]ID:1=categoryID_al{categoryLB})
					DELETE RECORD:C58([Category:3])
					If (OK=1)
						LISTBOX DELETE ROWS:C914(*;"categoryLB";categoryLB;1)
						If (categoryLB>Size of array:C274(categoryLB))
							categoryLB:=Size of array:C274(categoryLB)
						End if 
						loadTaskCategorySelection 
					End if 
			End case 
			
		End if 
End case 
