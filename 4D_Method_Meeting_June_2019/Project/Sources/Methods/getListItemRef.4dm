//%attributes = {"invisible":true}
C_TEXT:C284($1;$list_t;$2;$value_t)
C_LONGINT:C283($0;$find_l)

C_LONGINT:C283($list_l)

$list_t:=$1
$list_l:=Load list:C383($list_t)

If (Is a list:C621($list_l))
	$value_t:=":xliff:"+$2
	$find_l:=Find in list:C952($list_l;$value_t;0;*)
	CLEAR LIST:C377($list_l)
End if 

$0:=$find_l