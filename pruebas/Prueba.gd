extends Node2D



func _on_Area2D_input_event(viewport, event, shape_idx):
#	print(event.as_text())
	pass


func _on_TextureButton_pressed():
	print("texture button")


func _on_TextureButton_toggled(button_pressed):
	print("TOOGLE button")
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	print("PRESSED button")
	pass # Replace with function body.


func _on_TouchScreenButton_released():
	print("RELEASED button")
	pass # Replace with function body.
