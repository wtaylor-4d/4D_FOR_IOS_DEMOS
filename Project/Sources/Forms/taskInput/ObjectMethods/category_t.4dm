Case of 
	: (Form event:C388=On After Edit:K2:43)
		C_LONGINT:C283($bw;$bh;$bw1;$bh1)
		C_LONGINT:C283($l;$t;$r;$b;$ris_l;$i)
		
		C_TEXT:C284($firstname_t)
		$firstname_t:=Get edited text:C655
		If ($firstname_t#"")
			$firstname_t:=$firstname_t+"@"
			QUERY:C277([Category:3];[Category:3]Name:2=$firstname_t;*)
			QUERY:C277([Category:3]; & ;[Category:3]ID:1=Table:C252(->[Tasks:1]))
			$ris_l:=Records in selection:C76([Category:3])
			If ($ris_l>0)
				If ($ris_l>10)
					$ris_l:=10
					REDUCE SELECTION:C351([Category:3];$ris_l)
				End if 
				
				ARRAY TEXT:C222(autofill_preview_at;$ris_l)
				ARRAY BOOLEAN:C223(autofill_preview_lb;$ris_l)
				autofill_preview_lb:=0
				For ($i;1;$ris_l)
					autofill_preview_t:=[Category:3]Name:2
					autofill_preview_at{$i}:=autofill_preview_t
					autofill_preview_lb{$i}:=False:C215
					OBJECT GET BEST SIZE:C717(*;"autofill_preview_t";$bw1;$bh1)
					If ($bw1>$bw)
						$bw:=$bw1
					End if 
					NEXT RECORD:C51([Category:3])
				End for 
				
				$bh:=LISTBOX Get rows height:C836(*;"autofill_preview_lb";lk pixels:K53:22)*$ris_l
				
				OBJECT GET COORDINATES:C663(*;"autofill_preview_lb";$l;$t;$r;$b)
				OBJECT SET COORDINATES:C1248(*;"autofill_preview_lb";$l;$t;$bw+$l+25;$bh+$t)
				
				OBJECT SET VISIBLE:C603(*;"autofill_preview_at";True:C214)
				OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";True:C214)
				LISTBOX SET ROWS HEIGHT:C835(*;"autofill_preview_lb";25;lk pixels:K53:22)
				
			Else 
				OBJECT SET VISIBLE:C603(*;"autofill@";False:C215)
			End if 
		Else 
			OBJECT SET VISIBLE:C603(*;"autofill@";False:C215)
		End if 
End case 