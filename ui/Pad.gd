extends Node2D

onready var centro = $Centro
var centro_presionado = false

signal apuntar(rotacion)
signal no_apuntar(direccion)

var index_apuntar
var index_mover

onready var pos_ini_pad = $Centro.global_position



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			emit_signal("apuntar",0.0)
			centro_presionado = true
			index_apuntar = event.index

func _input(event):
	if event is InputEventScreenDrag and centro_presionado:
		if event.get_index() == index_apuntar:
			centro.global_position = event.position
			
			centro.position.x = clamp(centro.position.x, -50, 50)
			centro.position.y = clamp(centro.position.y,-50, 50)
			
			var rotacion_pad = rad2deg(Vector2.ZERO.angle_to_point(pos_ini_pad - event.position))
			emit_signal("apuntar",rotacion_pad)
			
	if event is InputEventScreenTouch :
		if !event.is_pressed() and centro_presionado and event.index == index_apuntar:
			centro_presionado = false
			centro.position = Vector2.ZERO
			emit_signal("no_apuntar",-(pos_ini_pad - event.position).normalized())
			get_parent().cola_armas.pop_back()
			get_parent().actualizar_armas_obtenidas()
			
