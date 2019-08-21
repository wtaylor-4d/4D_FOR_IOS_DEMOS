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
"table";$Obj_networkInput.dataClass;\
"ID";$Obj_networkInput.entity.primaryKey;\
"Status";$Obj_networkInput.Status

$Obj_result:=ModifyStatus ($Obj_in)


WEB SEND TEXT:C677(JSON Stringify:C1217($Obj_result))

