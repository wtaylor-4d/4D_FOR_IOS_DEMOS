//%attributes = {"invisible":true}
C_PICTURE:C286($0;$1;$pict_pic)
C_LONGINT:C283($2;$newWidth_l;$width_l;$height_l)
C_REAL:C285($ratio_r)
If (Count parameters:C259>=2)
	$pict_pic:=$1
	$newWidth_l:=$2
	PICTURE PROPERTIES:C457($pict_pic;$width_l;$height_l)
	$ratio_r:=$newWidth_l/$width_l
	TRANSFORM PICTURE:C988($pict_pic;Scale:K61:2;$ratio_r;$ratio_r)
	PICTURE PROPERTIES:C457($pict_pic;$width_l;$height_l)
	CREATE THUMBNAIL:C679($pict_pic;$pict_pic;$width_l;$height_l)
	$0:=$pict_pic
End if 