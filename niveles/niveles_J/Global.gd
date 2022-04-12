extends Node

#onready var puntuacion : int
onready var rng : RandomNumberGenerator= RandomNumberGenerator.new()

func random(min_numbre, max_number):
	rng.randomize()
	var random = rng.randf_range(min_numbre, max_number)
	return random
