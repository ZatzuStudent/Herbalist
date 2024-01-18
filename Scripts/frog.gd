extends Node2D

@onready var tongue = $Tongue

func _ready():
	tongue.points[0] = Vector2.ZERO
	tongue.points[1] = Vector2(497,-80)
	
func _process(_delta):
	if Input.is_action_pressed("mouse") == false:
		tongue.points[1] = to_local(GlobalScript.herbfallen)
