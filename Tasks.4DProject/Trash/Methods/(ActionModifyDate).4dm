//%attributes = {"invisible":true,"publishedWeb":true}

C_OBJECT:C1216($Obj_result;$Obj_in)

$Txt_buffer:=""
WEB GET HTTP BODY:C814($Txt_buffer)

If (Position:C15("{";$Txt_buffer)=1)  // if it is a json information send by client
	$Obj_networkInput:=JSON Parse:C1218($Txt_buffer)
Else   // we have nothing
	$Obj_networkInput:=New object:C1471
End if 

$Obj_in:=New object:C1471(\
"table";"Tasks";\
"ID";$Obj_networkInput.ID;\
"DueDate";$Obj_networkInput.DueDate;\
"StartDate";$Obj_networkInput.StartDate)

$Obj_result:=ModifyDate ($Obj_in)


WEB SEND TEXT:C677(JSON Stringify:C1217($Obj_result))

