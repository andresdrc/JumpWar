extends Node2D

onready var centro = $Centro
var centro_presionado = false

signal apuntar(direccion)
signal no_apuntar

func _ready():
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			centro_presionado = true
			

func _input(event):
	if event is InputEventScreenDrag and centro_presionado:
		var direccion_pad = event.relative.normalized()
		centro.position += direccion_pad
		centro.position.x = clamp(centro.position.x, -50, 50)
		centro.position.y = clamp(centro.position.y,-50, 50)
#		centro.position.x = clamp(centro.position.x, -(50 - centro.position.y * centro.position.y),(50 - centro.position.y * centro.position.y))
#		centro.position.y = clamp(centro.position.y, -(50 - centro.position.x * centro.position.x),(50 - centro.position.x * centro.position.x))
		emit_signal("apuntar",direccion_pad)
	if event is InputEventScreenTouch :
		if !event.is_pressed() and centro_presionado:
			centro_presionado = false
			centro.position = Vector2.ZERO
			emit_signal("no_apuntar")
			
