C_OBJECT:C1216($0)
C_OBJECT:C1216($1)

C_OBJECT:C1216($o;$context;$request;$result)

$request:=$1  // Informations provided by mobile application

$context:=$request.context

Case of 
		
	: ($request.action="actionModifyStatus@")
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"ID";$context.entity.primaryKey;\
			"CompletePercentage";Num:C11($request.action))
		
		$result:=modifyStatus ($o)
		
	: ($request.action="taskDone")
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"ID";$context.entity.primaryKey;\
			"CompletePercentage";100)
		
		$result:=modifyStatus ($o)
		
	: ($request.action="notStartedTask")
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"ID";$context.entity.primaryKey;\
			"CompletePercentage";0)
		
		$result:=modifyStatus ($o)
		
	: ($request.action="inProgressTask")
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"ID";$context.entity.primaryKey;\
			"Status";2)
		
		$result:=openCloseTask ($o)
		
	: ($request.action="postponeTask")
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"ID";$context.entity.primaryKey;\
			"Status";4)
		
		$result:=openCloseTask ($o)
		
	: ($request.action="allInProgress")
		
		
		If (True:C214)
			$o:=New object:C1471(\
				"dataClass";$context.dataClass;\
				"Status";2)
		Else 
			  //use the email from the web connection to update data
			$o:=New object:C1471(\
				"dataClass";$context.dataClass;\
				"Status";2;\
				"email";$request.userInfo.email)
		End if 
		
		$result:=openCloseAllTasks ($o)
		
		
	: ($request.action="postponeAll")
		
		
		If (True:C214)
			$o:=New object:C1471(\
				"dataClass";$context.dataClass;\
				"Status";4)
		Else 
			  //use the email from the web connection to update data
			$o:=New object:C1471(\
				"dataClass";$context.dataClass;\
				"Status";4;\
				"email";$request.userInfo.email)
		End if 
		
		
		
		$result:=openCloseAllTasks ($o)
		
	Else 
		
		  // Unknown request
		$result:=New object:C1471("success";False:C215)
		
End case 

$0:=$result  // Informations returned to mobile application