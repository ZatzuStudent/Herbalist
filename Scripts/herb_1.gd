extends RigidBody2D

var loveProperty = 1

var selected = false
var old_pos 

@onready var collision1 = $CollisionShape2D
@onready var collision2 = $Area2D/CollisionShape2D2
@onready var fresh = $fresh
@onready var dried = $Dried
@onready var button = $Button
@onready var dry_timer = $"Dry'Timer"

var toDry = false

func _ready():
	old_pos = position
	gravity_scale = false
	collision1.disabled = true
	collision2.disabled = true
	dried.visible = false
	isEaten = false
	fresh.visible = true

func _process(delta):
	if selected:
		collision1.disabled = false
		collision2.disabled = false
		gravity_scale = true
		position = get_parent().get_local_mouse_position()
		linear_velocity = (position-old_pos)/(delta*5)
		old_pos = position
		
	if isEaten == true && selected == false:
		GlobalScript.frogeating(global_position)
		
		position = lerp(position, get_parent().to_local(Vector2(-462,461)), delta * 10)
		
		

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
		dry_timer.start(2)
		loveProperty = loveProperty*2
		toDry = false
		gravity_scale = false
		button.visible = false
		collision1.disabled = true
		await get_tree().create_timer(0.01).timeout
		global_position = Vector2(497,-80)
		collision2.disabled = true

var isEaten

func _on_area_2d_area_entered(area):
	if area.is_in_group("bowl"):
		area.love(loveProperty)
		area.herb(1)
		queue_free()
	if area.is_in_group("drier") && selected == true && fresh.visible == true && GlobalScript.hasOneDrier == 0:
		GlobalScript.drierLoad(1)
		toDry = true
	if area.is_in_group("frogEatArea"):
		isEaten = true
	if area.is_in_group("eaternByFrog"):
		queue_free()
	else:
		return

func _on_area_2d_area_exited(area):
	if area.is_in_group("frogEatArea"):
		isEaten = false
