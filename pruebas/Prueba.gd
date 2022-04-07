extends Node2D


var cola = [1,2,3,4,5]

func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("jump"):
		for i in cola.invert():
			print(i)
