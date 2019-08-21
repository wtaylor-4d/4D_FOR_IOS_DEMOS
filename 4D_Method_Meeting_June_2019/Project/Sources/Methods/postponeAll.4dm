//%attributes = {}
C_OBJECT:C1216($0)
C_OBJECT:C1216($1)

C_OBJECT:C1216($entity;$in;$out)

$in:=$1

$out:=New object:C1471("success";False:C215)

If ($in.dataClass#Null:C1517)
	
	For each ($entity;ds:C1482[$in.dataClass].all())
		
		$entity.Status:=$in.Status
		$entity.save()
		
	End for each 
	
	$out.success:=True:C214  // notify App that action success
	$out.dataSynchro:=True:C214  // notify App to refresh the selection
	
Else 
	
	$out.errors:=New collection:C1472("No Selection")
	
End if 

$0:=$out