//%attributes = {"invisible":true}
C_LONGINT:C283($recInSel_l)
C_TEXT:C284(recordFound_t)

$recInSel_l:=Records in selection:C76([Tasks:1])
Case of 
	: ($recInSel_l=0)
		recordFound_t:=Get localized string:C991("No tasks")
	: (Records in selection:C76([Tasks:1])=1)
		recordFound_t:=Get localized string:C991("1 task")
	Else 
		recordFound_t:=String:C10(Records in selection:C76([Tasks:1]))+Get localized string:C991(" tasks")
End case 
