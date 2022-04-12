extends Area2D

var velocidad = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position.y += velocidad * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
