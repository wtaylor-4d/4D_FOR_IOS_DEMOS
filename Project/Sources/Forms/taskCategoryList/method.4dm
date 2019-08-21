If ((Form event:C388=On Load:K2:1))
	C_PICTURE:C286(rightArrow_pic;rightArrow_d_pic;empty_pic)
	C_TEXT:C284($path_t)
	$path_t:=Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"Navs"+Folder separator:K24:12+"r-arrow-16-sel.png"
	READ PICTURE FILE:C678($path_t;rightArrow_pic)
	$path_t:=Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"Navs"+Folder separator:K24:12+"r-arrow-16.png"
	READ PICTURE FILE:C678($path_t;rightArrow_d_pic)
End if 

Case of 
		
	: (Form event:C388=On Load:K2:1) | (Form event:C388=On Bound Variable Change:K2:52)
		C_LONGINT:C283($tableNumber_l;$foundat_l;Subform1)
		$tableNumber_l:=Table:C252(->[Tasks:1])
		QUERY:C277([Category:3];[Category:3]CategoryTypeID:3=$tableNumber_l)
		
		
		ARRAY TEXT:C222(categoryName_at;0)
		ARRAY PICTURE:C279(categoryNav_apic;0)
		ARRAY LONGINT:C221(categoryID_al;0)
		SELECTION TO ARRAY:C260([Category:3]Name:2;categoryName_at;[Category:3]ID:1;categoryID_al)
		INSERT IN ARRAY:C227(categoryName_at;1;1)
		INSERT IN ARRAY:C227(categoryNav_apic;1;1)
		INSERT IN ARRAY:C227(categoryID_al;1;1)
		categoryName_at{1}:=Get localized string:C991("All Categories")
		ARRAY TEXT:C222(frontPadding_at;Size of array:C274(categoryName_at))
		ARRAY BOOLEAN:C223(categoryLB;Size of array:C274(categoryName_at))
		ARRAY PICTURE:C279(categoryNav_apic;Size of array:C274(categoryName_at))
		
		
		
		If (Is record loaded:C669([Tasks:1]))
			$foundat_l:=Find in array:C230(categoryID_al;[Tasks:1]CategoryID:9)
		Else 
			$foundat_l:=Find in array:C230(categoryID_al;categoryID_l)
		End if 
		Case of 
			: ($foundat_l>0)
				categoryName_at:=$foundat_l
				categoryID_al:=categoryName_at
				LISTBOX SELECT ROW:C912(*;"categoryLB";$foundat_l)
				OBJECT SET SCROLL POSITION:C906(*;"List Box";$foundat_l)
				
				categoryNav_apic{$foundat_l}:=rightArrow_d_pic
				
			: (categoryName_at=0) & (Size of array:C274(categoryName_at)>0)
				categoryName_at:=1
				categoryID_al:=categoryName_at
			: (Size of array:C274(categoryName_at)>0) & (Size of array:C274(categoryName_at)<categoryName_at)
				categoryName_at:=Size of array:C274(categoryName_at)
				categoryID_al:=categoryName_at
		End case 
		
		
		searchTasks 
		
		Subform1:=Subform1+1
		
End case 