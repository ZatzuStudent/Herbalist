extends Node2D

var herb1 = load("res://Scenes/herb_1.tscn")
var herbglobal1
var herbglobal2
var herbglobal3
@onready var timer1 = $Node/Timer1
@onready var timer2 = $Node/Timer2
@onready var timer3 = $Node/Timer3

func _on_timer_timeout():
	var herb = herb1.instantiate()
	herb.position = Vector2 (69,72)
	add_child(herb)
	herbglobal1 = herb


func _on_timer_2_timeout():
	var herb = herb1.instantiate()
	herb.position = Vector2 (6,131)
	add_child(herb)
	herbglobal2 = herb

func _on_timer_3_timeout():
	var herb = herb1.instantiate()
	herb.position = Vector2 (-52,64)
	add_child(herb)
	herbglobal3 = herb

func _process(_delta):
	_herb_produce1()
	_herb_produce2()
	_herb_produce3()

func _herb_produce1():
	if timer1.is_stopped():
		if herbglobal1.position == Vector2 (69,72):
			timer1.stop()
		else:
			timer1.start()
	else:
		return

func _herb_produce2():
	if timer2.is_stopped():
		if herbglobal2.position == Vector2 (6,131):
			timer2.stop()
		else:
			timer2.start()
	else:
		return

func _herb_produce3():
	if timer3.is_stopped():
		if herbglobal3.position == Vector2 (-52,64):
			timer3.stop()
		else:
			timer3.start()
	else:
		return
