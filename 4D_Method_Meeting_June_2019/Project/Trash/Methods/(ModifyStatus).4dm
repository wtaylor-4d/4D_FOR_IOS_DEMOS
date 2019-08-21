//%attributes = {"invisible":true}

  // Get parameters
C_OBJECT:C1216($Obj_in;$Obj_out;$selection;$record;$status)
$Obj_in:=$1
$Obj_out:=New object:C1471("success";False:C215)

  // Travail

If (Length:C16(String:C10($Obj_in.dataClass))>0)
	
	$Obj_dataClass:=ds:C1482[$Obj_in.dataClass]
	
	  // if $Obj_table est pas null
	
	If ($Obj_in.ID#Null:C1517)
		
		$selection:=$Obj_dataClass.query("ID="+String:C10($Obj_in.ID))
		
		If ($selection.length>0)
			
			$record:=$selection.first()
			$record.CompletePercentage:=$Obj_in.CompletePercentage
			
			Case of 
				: ($Obj_in.Status#2)
					$record.Status:=2
					
				: ($Obj_in.Status=0)
					$record.Status:=0
					
				Else 
					  //
			End case 
			
			$status:=$record.save()
			
			If ($status.success)
				
				$Obj_out.success:=True:C214
				$Obj_out.dataSynchro:=True:C214
				
			Else 
				
				$Obj_out:=$status
				
			End if 
			
		Else 
			$Obj_out.errors:=New collection:C1472("No record found with ID "+String:C10($Obj_in.ID))
			
			
		End if 
	Else 
		$Obj_out.errors:=New collection:C1472("The record ID must be specified")
		
		
	End if 
Else 
	$Obj_out.errors:=New collection:C1472("The dataClass name must be specified")
	
	
End if 



  // Fin

$0:=$Obj_out