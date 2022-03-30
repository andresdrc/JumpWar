extends RigidBody2D

var gravedad
var velocidad

func _ready():
	add_force(Vector2.ZERO, Vector2(0.5, -0.5))

func _input(event):

	if Input.is_action_just_pressed("jump"):
		print("6s45df5sd4f654")
		add_force(Vector2.ZERO, Vector2(100, -100))
		
