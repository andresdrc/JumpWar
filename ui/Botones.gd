extends Node2D


func _on_Boton_der_input_event(viewport, event, shape_idx):
	if event is InputEventScreenDrag:
		Input.action_press("move_right",1.0)
	if event is InputEventScreenTouch:
		if event.is_pressed():
			Input.action_press("move_right",1.0)
		if !event.is_pressed():
			Input.action_release("move_right")
func _on_Boton_der_mouse_exited():
	Input.action_release("move_right")


func _on_Boton_iz_input_event(viewport, event, shape_idx):
	if event is InputEventScreenDrag:
		Input.action_press("move_left",1.0)
	if event is InputEventScreenTouch:
		if event.is_pressed():
			Input.action_press("move_left",1.0)
		if !event.is_pressed():
			Input.action_release("move_left")
func _on_Boton_iz_mouse_exited():
	Input.action_release("move_left")


func _on_Boton_salto_pressed():
	Input.action_press("jump",1.0)
func _on_Boton_salto_released():
	Input.action_release("jump")





