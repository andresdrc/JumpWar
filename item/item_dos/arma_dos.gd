extends RigidBody2D

var gravedad
var velocidad = 1000

var direccion

var tam_pantalla

func _ready():
	sleeping = true
	
	tam_pantalla = get_viewport_rect().size
	

func lanzar(dir):
	apply_impulse(Vector2(5,5),dir * velocidad)

func _process(delta):
	if global_position.x > tam_pantalla.x or global_position.y > tam_pantalla.y:
		queue_free()
