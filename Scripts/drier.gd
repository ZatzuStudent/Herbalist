extends Area2D

var full
@onready var basket_contents = $BasketContents

func _ready():
	basket_contents = false
	
func _process(_delta):
	if full == true:
		basket_contents.visible = true
		
