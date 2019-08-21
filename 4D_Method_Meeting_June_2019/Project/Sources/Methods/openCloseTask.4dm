//%attributes = {}
C_OBJECT:C1216($0)
C_OBJECT:C1216($1)

C_OBJECT:C1216($dataClass;$entity;$in;$out;$status;$selection)

$in:=$1

$selection:=ds:C1482[$in.dataClass].query("ID = :1";String:C10($in.ID))

If ($selection.length=1)
	
	$entity:=$selection[0]
	
	$entity.Status:=$in.Status
	
	$status:=$entity.save()
	
	$out:=New object:C1471
	
	If ($status.success)
		
		$out.success:=True:C214  // notify App that action success
		$out.dataSynchro:=True:C214  // notify App to refresh this entity
		
	Else 
		
		$out:=$status  // return status to the App
		
	End if 
	
Else 
	
	$out.success:=False:C215  // notify App that action failed
	
End if 

$0:=$out