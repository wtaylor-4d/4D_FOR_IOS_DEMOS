
If (Form event:C388=On Bound Variable Change:K2:52)
	
	C_LONGINT:C283($foundat_l)
	ARRAY LONGINT:C221($recordNum_al;0)
	SELECTION TO ARRAY:C260([Tasks:1];$recordNum_al)
	$foundat_l:=Find in array:C230($recordNum_al;recordNumber_l)
	If ($foundat_l#-1)
		selectedRecordNumber_l:=$foundat_l
	End if 
	
	Case of 
		: (selectedRecordNumber_l<=0) & (Size of array:C274($recordNum_al)>0)
			selectedRecordNumber_l:=1
	End case 
	
	GOTO SELECTED RECORD:C245([Tasks:1];selectedRecordNumber_l)
	LISTBOX SELECT ROW:C912(*;"List Box";selectedRecordNumber_l)
	OBJECT SET SCROLL POSITION:C906(*;"List Box";selectedRecordNumber_l)
	
	REDRAW:C174(List Box)
	If (Subform2=Null:C1517)
		Subform2:=0
	End if 
	Subform2:=Subform2+1
	
	  //GOTO OBJECT(*;"List Box")
	
	updateTaskRecordFound 
	
End if 