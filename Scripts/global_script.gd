extends Node

var hasOneDrier
var herbfallen

func _ready():
	hasOneDrier = 0
	herbfallen = Vector2(0,0)

func drierLoad(value):
	hasOneDrier = value

func frogeating(value):
	herbfallen = value
