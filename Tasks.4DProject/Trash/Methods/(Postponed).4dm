//%attributes = {"invisible":true}
C_OBJECT:C1216($Obj_in;$Obj_out;$selection;$record;$status)
$Obj_in:=$1
$Obj_out:=New object:C1471("success";False:C215)

$Obj_dataClass:=ds:C1482[$Obj_in.dataClass]

$selection:=$Obj_dataClass.query("ID="+String:C10($Obj_in.ID))

$record:=$selection.first()

$record.Status:=4

$status:=$record.save()

If ($status.success)
	
	$Obj_out.success:=True:C214
	$Obj_out.dataSynchro:=True:C214
	
Else 
	
	$Obj_out:=$status
	
End if 


$0:=$Obj_out