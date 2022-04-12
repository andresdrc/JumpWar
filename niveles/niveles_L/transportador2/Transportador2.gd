extends Node2D

export var dur_inac: float = 0.5

var speed

export var mover_a: Vector2
export var tama_cell: Vector2
export var velocidad: float = 10

var seguir: Vector2 = Vector2.ZERO
onready var Transportador = $KinematicBody2D
onready var tween = $MoviTween

func _ready() -> void:
	_init_tween()
	speed = Global.random(32, 42)		
	
func _init_tween() -> void:
	
	mover_a.x = Global.random(2, 7)
	mover_a = mover_a * tama_cell
	var durac = mover_a.length() / velocidad 
	tween.interpolate_property(self, "seguir", Vector2.ZERO, mover_a, durac, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, dur_inac)
	tween.interpolate_property(self, "seguir", mover_a, Vector2.ZERO, durac, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, durac + dur_inac * 16)
	tween.start()
	
func _physics_process(delta):
	Transportador.position = seguir	
	position.y += speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
