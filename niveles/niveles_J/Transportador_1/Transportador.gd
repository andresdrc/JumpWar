extends Node2D

export var dur_inact: float = 1.2

var speed= 50

export var mover_a : Vector2
export var tama_cell: Vector2
export var velocidadT: float = 3.0

var seguir: Vector2 = Vector2.ZERO 
onready var PlataformaMovil = $KinematicBody2D 
onready var tween = $MoviTween 
 
func _ready() -> void: 
	_init_twen()
	#speed = GLOBAL.random(32, 42) 
 
func _init_twen() -> void: 
	#mover_a.x = GLOBAL.random(2,6)
	var ran = RandomNumberGenerator.new()
	ran.randomize()
	var num= int (ran.randf_range(1.0,3.0))
	print(num)
	mover_a = mover_a * tama_cell 
	var durac = mover_a.length() / velocidadT 
	tween.interpolate_property(self,"seguir", Vector2.ZERO, mover_a,durac,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, dur_inact)
	tween.interpolate_property(self,"seguir", mover_a, Vector2.ZERO,durac,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, durac + dur_inact * 2)
	if num == 1.0:
		tween.interpolate_property(self,"seguir", Vector2.ZERO, mover_a,durac,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, dur_inact)
		tween.interpolate_property(self,"seguir", mover_a, Vector2.ZERO,durac,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, durac + dur_inact * 2)
		print("izquierda")
	else:
		tween.interpolate_property(self,"seguir", Vector2.ZERO, -mover_a,durac,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, dur_inact)
		tween.interpolate_property(self,"seguir", -mover_a, Vector2.ZERO,durac,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, durac + dur_inact * 2)
		print('derecha')
	
	tween.start()

func _physics_process(delta):
	PlataformaMovil.position = seguir
	position.y += speed * delta
	#queue_free()
	



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
