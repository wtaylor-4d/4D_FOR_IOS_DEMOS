//%attributes = {"invisible":true}
C_OBJECT:C1216($Obj_result)
$Obj_result:=ModifyDate (New object:C1471("table";"Tasks";"ID";1;"DueDate";Current date:C33;"StartDate";Current date:C33+1)

ASSERT:C1129(Bool:C1537($Obj_result.success);"Failed to modifiy date"+JSON Stringify:C1217($Obj_result))