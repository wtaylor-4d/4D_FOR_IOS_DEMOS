//%attributes = {"invisible":true}
C_LONGINT:C283(Ruler)
C_LONGINT:C283(highPriority_l;lowPriority_l;noPriority_l)
C_LONGINT:C283(delButton;saveButton)
C_TEXT:C284(category_t)
autoFillSetObject ("category_t")

highPriority_l:=0
lowPriority_l:=0
noPriority_l:=0

OBJECT SET LIST BY NAME:C237(*;"Field6";Choice list:K42:19;Get localized string:C991("Task Status"))

If (Is new record:C668([Tasks:1]))
	If (categoryID_al{categoryName_at}>0)
		category_t:=categoryName_at{categoryName_at}
		[Tasks:1]CategoryID:9:=categoryID_al{categoryName_at}
	Else 
		category_t:=""
	End if 
	[Tasks:1]Status:7:=1  //"Not Started"
	Ruler:=0
	noPriority_l:=1
	OBJECT SET ENABLED:C1123(*;"@";True:C214)
	OBJECT SET ENABLED:C1123(*;"delButton";False:C215)
	OBJECT SET ENABLED:C1123(*;"saveButton";False:C215)
Else 
	
	If (Records in selection:C76([Tasks:1])>0)
		QUERY:C277([Category:3];[Category:3]ID:1=[Tasks:1]CategoryID:9)
		category_t:=[Category:3]Name:2
		
		Case of 
			: ([Tasks:1]Priority:8=2)
				highPriority_l:=1
			: ([Tasks:1]Priority:8=1)
				lowPriority_l:=1
			Else 
				noPriority_l:=1
		End case 
		
		Ruler:=[Tasks:1]CompletePercentage:11
		OBJECT SET ENABLED:C1123(*;"@";True:C214)
	Else 
		category_t:=""
		OBJECT SET ENABLED:C1123(*;"@";False:C215)
		
	End if 
	
	categoryID_l:=[Tasks:1]CategoryID:9
End if 