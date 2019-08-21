Ruler:=Self:C308->

Case of 
	: (Ruler>100)
		Self:C308->:=100
		[Tasks:1]Status:7:=3  //"Completed"
	: (Ruler=100)
		[Tasks:1]Status:7:=3  //"Completed"
	: (Ruler>0)
		[Tasks:1]Status:7:=2  //"In Progress"
	Else 
		[Tasks:1]Status:7:=1  //"Not Started"
End case 
