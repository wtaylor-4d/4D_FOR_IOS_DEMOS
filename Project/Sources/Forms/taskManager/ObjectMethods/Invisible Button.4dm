  //C_LONGINT($selected_l)
  //$selected_l:=Pop up menu("All;Incomplete;Completed")
C_TEXT:C284($menu_t;$selected_t)
$menu_t:=Create menu:C408
APPEND MENU ITEM:C411($menu_t;":xliff:All")
SET MENU ITEM PARAMETER:C1004($menu_t;-1;"All")
APPEND MENU ITEM:C411($menu_t;":xliff:Incomplete")
SET MENU ITEM PARAMETER:C1004($menu_t;-1;"Incomplete")
APPEND MENU ITEM:C411($menu_t;":xliff:Completed")
SET MENU ITEM PARAMETER:C1004($menu_t;-1;"Completed")

$selected_t:=Dynamic pop up menu:C1006($menu_t)
RELEASE MENU:C978($menu_t)

If ($selected_t#"")
	
	OBJECT SET PLACEHOLDER:C1295(*;"searchText_t";Get localized string:C991($selected_t+" Tasks"))
	searchTaskStatus_t:=$selected_t
	
	searchTasks 
	
End if 

  //Case of 
  //: ($selected_l=1)
  //OBJECT SET PLACEHOLDER(*;"searchText_t";Get localized string("All Tasks"))
  //searchTaskStatus_t:="All"
  //: ($selected_l=2)
  //OBJECT SET PLACEHOLDER(*;"searchText_t";Get localized string("Incomplete Tasks"))
  //searchTaskStatus_t:="Incomplete"
  //: ($selected_l=3)
  //OBJECT SET PLACEHOLDER(*;"searchText_t";Get localized string("Completed Tasks"))
  //searchTaskStatus_t:="Completed"
  //End case 

  //searchTasks 