extends Area2D

var potion1 = load("res://Scenes/potion_1.tscn")
var numberOfHerbs = 0

var loveHerb = 0
var healHerb = 0

func herb(value):
	numberOfHerbs += value
	
func love(value):
	loveHerb += value

func heal(value):
	healHerb += value

func _on_button_button_down():
	print('loveHerb:', loveHerb)
	print('healHerb:', healHerb)
	print('numberOfHerbs:', numberOfHerbs)

func _on_area_entered(_area):
	if numberOfHerbs == 2:
		var potion = potion1.instantiate()
		potion.global_position = Vector2 (0,0)
		add_child(potion)
		print('Done')
		
