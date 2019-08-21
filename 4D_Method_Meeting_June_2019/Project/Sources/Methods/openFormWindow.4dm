//%attributes = {"invisible":true}
C_TEXT:C284($1)  // Form name

If (Count parameters:C259>=1)
	SET MENU BAR:C67(1)
	C_TEXT:C284($menu_t)
	$menu_t:=Get menu bar reference:C979
	DISABLE MENU ITEM:C150($menu_t;1)
	C_LONGINT:C283($win_l)
	$win_l:=Open form window:C675($1)
	DIALOG:C40($1)
	CLOSE WINDOW:C154($win_l)
	ENABLE MENU ITEM:C149($menu_t;1)
End if 