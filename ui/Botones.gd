extends Node2D

var index_mov_d = 0
var index_mov_i = 0

var player




func _ready():
	player = get_parent().get_node("Player")
	player.connect("item_uno_obtenido", self, "_item_uno_obtenido")
	pass

func _item_uno_obtenido():
	$BarraItems/MarginContainer/ColorRect/TextureRect.show()
	

func _on_Boton_salto_pressed():
	Input.action_press("jump",1.0)
func _on_Boton_salto_released():
	Input.action_release("jump")


func _on_Btn_der_pressed():
	Input.action_press("move_right",1.0)
func _on_Btn_der_released():
	Input.action_release("move_right")


func _on_Btn_izq_pressed():
	Input.action_press("move_left",1.0)
func _on_Btn_izq_released():
	Input.action_release("move_left")


