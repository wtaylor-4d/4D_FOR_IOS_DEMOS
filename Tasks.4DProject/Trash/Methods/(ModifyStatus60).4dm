//%attributes = {"invisible":true}

  // Get parameters
C_OBJECT:C1216($Obj_in;$Obj_out;$selection;$record;$status)
$Obj_in:=$1
$Obj_out:=New object:C1471("success";False:C215)

  // Travail

If (Length:C16(String:C10($Obj_in.table))>0)
	
	If ($Obj_in.ID#Null:C1517)
		
		$selection:=ds:C1482[$Obj_in.table].query("ID="+String:C10($Obj_in.ID))
		
		If ($selection.length>0)
			
			$record:=$selection.first()
			
			If ($Obj_in.Status#Null:C1517)
				
				$record.Status:=$Obj_in.Status
				$record.CompletePercentage:=$Obj_in.CompletePercentage
				
				$status:=$record.save()
			Else 
				  //$record.Status:=$Obj_in.Status
				  //$record.CompletePercentage:=$Obj_in.CompletePercentage
				$record.Status:=2
				$record.CompletePercentage:=60
				$status:=$record.save()
				
				If ($status.success=True:C214)
					
					$Obj_out.action:="refresh"
					
					$Obj_out.record:=$record
					
					$Obj_out.success:=True:C214
					
				Else 
					
					$Obj_out:=$status
					
					
				End if 
				
				
				
			Else 
				$Obj_out.errors:=New collection:C1472("No Status available")
				
			End if 
			
		Else 
			$Obj_out.errors:=New collection:C1472("No record found with ID "+String:C10($Obj_in.ID))
			
			
		End if 
	Else 
		$Obj_out.errors:=New collection:C1472("The record ID must be specified")
		
		
	End if 
Else 
	$Obj_out.errors:=New collection:C1472("The table name must be specified")
	
	
End if 



  // Fin

$0:=$Obj_out