//%attributes = {"invisible":true}
C_LONGINT:C283($win_l)
$win_l:=Open form window:C675([Tasks:1];"taskInput2")
ADD RECORD:C56([Tasks:1];*)
CLOSE WINDOW:C154($win_l)

If (OK=1)
	categoryID_l:=[Tasks:1]CategoryID:9
	selectedRecordNumber_l:=Selected record number:C246([Tasks:1])
	recordNumber_l:=Record number:C243([Tasks:1])
	If (categoryLB>1)
		UNLOAD RECORD:C212([Tasks:1])
		Subform0:=Subform0+1
	End if 
Else 
	GOTO SELECTED RECORD:C245([Tasks:1];Selected record number:C246([Tasks:1]))
	If (Subform2=Null:C1517)
		Subform2:=0
	End if 
	Subform2:=Subform2+1
	categoryID_l:=[Tasks:1]CategoryID:9
	LISTBOX SELECT ROW:C912(*;"List Box";Selected record number:C246([Tasks:1]))
	OBJECT SET SCROLL POSITION:C906(*;"List Box";Selected record number:C246([Tasks:1]))
End if 