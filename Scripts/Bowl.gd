extends Area2D


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
