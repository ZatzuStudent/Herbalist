extends RigidBody2D

var selected = false
var force = 0
var old_pos 
@onready var collision1 = $CollisionShape2D
@onready var collision2 = $Area2D/CollisionShape2D2
var loveProperty = 3
@onready var fresh = $fresh
@onready var dried = $Dried
var toDry = false
@onready var button = $Button
@onready var dry_timer = $"Dry'Timer"

func _ready():
	old_pos = position
	gravity_scale = false
	collision1.disabled = true
	collision2.disabled = true
	dried.visible = false
	fresh.visible = true

func _process(delta):
	if selected:
		collision1.disabled = false
		collision2.disabled = false
		gravity_scale = true
		position = get_parent().get_local_mouse_position()
		linear_velocity = (position-old_pos)/(delta*4)
		old_pos = position
	
func _on_dry_timer_timeout():
	button.visible = true
	dried.visible = true
	fresh.visible = false

		
func _on_button_button_down():
	selected = true
	
func _on_button_button_up():
	selected = false
	_to_dry()
		
func _to_dry():
	
	if toDry == true && selected == false:
		global_position = Vector2(497,-80)
		dry_timer.start(2)
		global_position = Vector2(497,-80)
		loveProperty = loveProperty*2
		toDry = false
		gravity_scale = false
		button.visible = false
		collision1.disabled = true
		collision2.disabled = true

func _on_area_2d_area_entered(area):
	if area.is_in_group("bowl"):
		area.love(loveProperty)
		area.herb(1)
		queue_free()
	if area.is_in_group("drier") && selected == true && fresh.visible == true:
		toDry = true
		
	else:
		return


