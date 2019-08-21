Case of 
	: (Form event:C388=On Clicked:K2:4)
		GOTO SELECTED RECORD:C245([Category:3];autofill_preview_lb)
		[Tasks:1]CategoryID:9:=[Category:3]ID:1
		category_t:=[Category:3]Name:2
		OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)
		
End case 