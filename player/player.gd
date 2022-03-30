extends KinematicBody2D


export var vel_avanzar = 300
var fuerza_salto = 900
export var gravedad = 1500
var direccion = Vector2.ZERO

var salud = 100

var pad

onready var sprt_apuntar = $SpriteApuntar
var rot_apuntar = 0.0

signal item_uno_obtenido

func _ready():
	pad = get_tree().get_nodes_in_group("pad")[0]
	pad.connect("apuntar", self, "_apuntar")
	pad.connect("no_apuntar", self, "_no_apuntar")
	

func _physics_process(delta):
	
	direccion.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))  * vel_avanzar
	if !is_on_floor():
		direccion.y += gravedad * delta
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		direccion.y -= fuerza_salto

	direccion = move_and_slide(direccion, Vector2.UP, true, 4, 0.7853, true)

func _process(delta):
	
	sprt_apuntar.rotation_degrees = rot_apuntar
func _no_apuntar():
	sprt_apuntar.visible = false
	
func _apuntar(dir):
	sprt_apuntar.visible = true
	rot_apuntar = dir

func _on_Area2D_area_entered(area):
	if area.is_in_group("item_uno"):
		emit_signal("item_uno_obtenido")
		area.queue_free()
