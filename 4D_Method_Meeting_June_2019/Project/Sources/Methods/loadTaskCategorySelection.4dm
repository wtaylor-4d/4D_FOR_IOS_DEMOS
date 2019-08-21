//%attributes = {"invisible":true}
C_LONGINT:C283($i)

For ($i;1;Size of array:C274(categoryLB))
	If ($i=categoryLB)
		categoryNav_apic{$i}:=rightArrow_pic
	Else 
		categoryNav_apic{$i}:=empty_pic
	End if 
End for 

If (categoryLB>Size of array:C274(categoryLB))
	categoryLB:=Size of array:C274(categoryLB)
End if 

searchTasks 

Subform1:=Subform1+1
updateTaskRecordFound 