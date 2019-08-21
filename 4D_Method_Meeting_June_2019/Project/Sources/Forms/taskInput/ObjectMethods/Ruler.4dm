[Tasks:1]CompletePercentage:11:=Self:C308->

Case of 
	: ([Tasks:1]CompletePercentage:11>100)
		Self:C308->:=100
		[Tasks:1]Status:7:=3  //"Completed"
	: ([Tasks:1]CompletePercentage:11=100)
		[Tasks:1]Status:7:=3  //"Completed"
	: ([Tasks:1]CompletePercentage:11>0)
		[Tasks:1]Status:7:=2  //"In Progress"
	Else 
		[Tasks:1]Status:7:=1  //"Not Started"
End case 
