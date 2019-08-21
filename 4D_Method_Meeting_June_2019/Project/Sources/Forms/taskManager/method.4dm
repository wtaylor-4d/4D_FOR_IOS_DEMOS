Case of 
	: (Form event:C388=On Resize:K2:27)
		If (taskListDetailMode_b)
			C_LONGINT:C283($l;$t;$r;$b)
			OBJECT GET COORDINATES:C663(*;"Subform1";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"Subform1";$l;$t;$l+337;$b)
		End if 
		
	: (Form event:C388=On Load:K2:1)
		C_BOOLEAN:C305(taskListDetailMode_b)
		taskListDetailMode_b:=True:C214
		
	: (Form event:C388=On Unload:K2:2)
		categoryLB:=1
		
End case 