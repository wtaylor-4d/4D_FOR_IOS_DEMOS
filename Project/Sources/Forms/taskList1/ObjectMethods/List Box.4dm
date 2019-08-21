Case of 
	: (Form event:C388=On Selection Change:K2:29)
		GOTO SELECTED RECORD:C245([Tasks:1];Selected record number:C246([Tasks:1]))
		If (Subform2=Null:C1517)
			Subform2:=0
		End if 
		Subform2:=Subform2+1
		LISTBOX SELECT ROW:C912(*;"List Box";Selected record number:C246([Tasks:1]))
		OBJECT SET SCROLL POSITION:C906(*;"List Box";Selected record number:C246([Tasks:1]))
		selectedRecordNumber_l:=Selected record number:C246([Tasks:1])
		recordNumber_l:=Record number:C243([Tasks:1])
		
	: (Form event:C388=On Double Clicked:K2:5)
		
		If (Records in set:C195("$ListboxSet0")>0)
			C_LONGINT:C283($win_l)
			$win_l:=Open form window:C675([Tasks:1];"taskInput2";Modal form dialog box:K39:7)
			MODIFY RECORD:C57([Tasks:1];*)
			CLOSE WINDOW:C154($win_l)
			If (OK=1)
				If (categoryLB>1)
					Subform0:=Subform0+1
				Else 
					REDRAW:C174(List Box)
				End if 
			Else 
				LISTBOX SELECT ROW:C912(*;"List Box";Selected record number:C246([Tasks:1]))
				Subform1:=Subform1+1
			End if 
		Else 
			createTaskWindow 
		End if 
		
End case 
