//%attributes = {"invisible":true}
C_TEXT:C284($0;$color_t;$fontsize_t;$sp)
$sp:="_"
If ([Tasks:1]CompletePercentage:11=0)
	
	$0:="<span>"+(Char:C90(Space:K15:42)*5)+"</span><span style=\"color:#FF8000; background-color:#FFFFFF;\">  "+Get localized string:C991(Choose:C955([Tasks:1]Status:7;"";"Not Started";"In Progress";"Completed";"Postponed"))+"  </span>"
Else 
	
	If ([Tasks:1]CompletePercentage:11=100)
		$color_t:="#00AEEF"
	Else 
		$color_t:="#FF8000"
	End if 
	
	If (Folder separator:K24:12=":")
		$fontsize_t:="12px;"
	Else 
		$fontsize_t:="10px;"
	End if 
	
	$0:="<span>"+(Char:C90(Space:K15:42)*5)+"</span><span style=\"font-size: "+$fontsize_t+"; background-color:"+$color_t+"; color:"+$color_t+";\">"+(($sp)*[Tasks:1]CompletePercentage:11)+"</span><span style=\"color:#666666; background-color:#FFFFFF;\"> "+String:C10([Tasks:1]CompletePercentage:11)+"% </span>"
End if 