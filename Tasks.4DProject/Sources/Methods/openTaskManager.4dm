//%attributes = {}
C_LONGINT:C283(Subform0;Subform1;Subform2)
C_LONGINT:C283(categoryID_l;recordNumber_l)
C_TEXT:C284(searchTaskStatus_t;searchText_t)
C_LONGINT:C283(selectedRecordNumber_l;recordNumber_l)

searchTaskStatus_t:="All"

openFormWindow ("taskManager")
UNLOAD RECORD:C212([Tasks:1])