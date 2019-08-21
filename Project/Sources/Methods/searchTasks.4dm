//%attributes = {"invisible":true}

searchText_t:=Get edited text:C655
Case of 
	: (searchTaskStatus_t=Null:C1517)
		
	: (searchTaskStatus_t="All")
		If (categoryID_al{categoryLB}=0)
			If (searchText_t="")
				ALL RECORDS:C47([Tasks:1])
			Else 
				QUERY:C277([Tasks:1];[Tasks:1]Title:2=searchText_t+"@")
			End if 
		Else 
			If (searchText_t="")
				QUERY:C277([Tasks:1];[Tasks:1]CategoryID:9=categoryID_al{categoryLB})
			Else 
				QUERY:C277([Tasks:1];[Tasks:1]CategoryID:9=categoryID_al{categoryLB};*)
				QUERY:C277([Tasks:1]; & ;[Tasks:1]Title:2=searchText_t+"@")
			End if 
		End if 
	Else 
		
		C_TEXT:C284($searchTaskOperator_t)
		C_LONGINT:C283($searchTaskAll_l)
		
		$searchTaskAll_l:=3
		
		If (searchTaskStatus_t="Completed")
			$searchTaskOperator_t:="="
		Else 
			$searchTaskOperator_t:="#"
		End if 
		
		If (categoryID_al{categoryLB}=0)
			If (searchText_t="")
				QUERY:C277([Tasks:1];[Tasks:1]Status:7;$searchTaskOperator_t;$searchTaskAll_l)
			Else 
				QUERY:C277([Tasks:1];[Tasks:1]Status:7;$searchTaskOperator_t;$searchTaskAll_l;*)
				QUERY:C277([Tasks:1]; & ;[Tasks:1]Title:2=searchText_t+"@")
			End if 
		Else 
			If (searchText_t="")
				QUERY:C277([Tasks:1];[Tasks:1]Status:7;$searchTaskOperator_t;$searchTaskAll_l;*)
				QUERY:C277([Tasks:1]; & ;[Tasks:1]CategoryID:9=categoryID_al{categoryLB})
			Else 
				QUERY:C277([Tasks:1];[Tasks:1]Status:7;$searchTaskOperator_t;$searchTaskAll_l;*)
				QUERY:C277([Tasks:1]; & ;[Tasks:1]CategoryID:9=categoryID_al{categoryLB};*)
				QUERY:C277([Tasks:1]; & ;[Tasks:1]Title:2=searchText_t+"@")
			End if 
		End if 
End case 

If (Records in selection:C76([Tasks:1])<selectedRecordNumber_l)
	selectedRecordNumber_l:=0
	recordNumber_l:=0
Else 
	C_LONGINT:C283($foundat_l)
	ARRAY LONGINT:C221($recordNum_al;0)
	SELECTION TO ARRAY:C260([Tasks:1];$recordNum_al)
	$foundat_l:=Find in array:C230($recordNum_al;recordNumber_l)
	If ($foundat_l#-1)
		selectedRecordNumber_l:=$foundat_l
	Else 
		selectedRecordNumber_l:=0
		recordNumber_l:=0
	End if 
End if 