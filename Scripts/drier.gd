extends Area2D

@onready var basket_contents_dried = $BasketContentsDried
@onready var basket_contents = $BasketContents
@onready var hasHerb = $HasHerb2D
@onready var collision = $CollisionShape2D

func _ready():
	basket_contents.visible = false
	basket_contents_dried.visible = false
	hasHerb.visible = false

func _on_area_exited(area):
	if area.is_in_group("herb1") && Input.is_action_just_released("mouse"):
		$Timer.start()
		basket_contents.visible = true

func _on_timer_timeout():
	basket_contents_dried.visible = true
	basket_contents.visible = false
	hasHerb.visible = true

func _on_has_herb_2d_area_exited(area):
	if area.is_in_group("herb1"):
		basket_contents_dried.visible = false
		GlobalScript.drierLoad(0)
