//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 05/05/16, 10:46:37
  // ----------------------------------------------------
  // Method: autoFillSetObject
  // Description
  //    
  //
  // Parameters
  //   $1   -   Name of the Object that initiate auto-fill
  // ----------------------------------------------------

C_TEXT:C284($1;$activeObject)

$activeObject:=$1

  // *** Make sure the listbox is positioned
  // *** underneath the given object
OBJECT GET COORDINATES:C663(*;$activeObject;$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"autofill_preview_lb";$l;$b)

  // *** Make sure the On After Edit event is triggered
  // *** while the user type in the object.
ARRAY LONGINT:C221($event_al;1)
$event_al{1}:=On After Edit:K2:43
OBJECT SET EVENTS:C1239(*;$activeObject;$event_al;Enable events others unchanged:K42:38)