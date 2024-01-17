extends Node

var hasOneDrier
var herbfallen

func _ready():
	hasOneDrier = 0
	herbfallen = Vector2(-462,461)

func drierLoad(value):
	hasOneDrier = value

func frogeating(value):
	herbfallen = value
