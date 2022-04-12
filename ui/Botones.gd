extends Node2D

var index_mov_d = 0
var index_mov_i = 0

var player

var sprite_arma_uno = preload("res://ui/stun.png")
var sprite_arma_dos = preload("res://ui/inmovil.png")
var sprite_arma_tres = preload("res://ui/golpe.png")

var cola_armas = []
onready var array_texturas = [$BarraItems/MarginContainer/ColorRect/TextureRect,
$BarraItems/MarginContainer/ColorRect/TextureRect2,
$BarraItems/MarginContainer/ColorRect/TextureRect3,
$BarraItems/MarginContainer/ColorRect/TextureRect4]



func _ready():
	player = get_parent().get_node("Player")
	if player != null:
		player.connect("item_uno_obtenido", self, "_item_uno_obtenido")
		player.connect("item_dos_obtenido", self, "_item_dos_obtenido")
		player.connect("item_tres_obtenido", self, "_item_tres_obtenido")


##STUN
#func _item_uno_obtenido():
#	cola_armas.push_back(sprite_arma_uno)
##	print(cola_armas)
#	actualizar_armas_obtenidas()
##INMOVIL
#func _item_dos_obtenido():
#	cola_armas.push_back(sprite_arma_dos)
##	print(cola_armas)
#	actualizar_armas_obtenidas()
##GOLPE
#func _item_tres_obtenido():
#	cola_armas.push_back(sprite_arma_tres)
##	print(cola_armas)
#	actualizar_armas_obtenidas()



#STUN
func _item_uno_obtenido():
	cola_armas.push_front(sprite_arma_uno)
	actualizar_armas_obtenidas()
#INMOVIL
func _item_dos_obtenido():
	cola_armas.push_front(sprite_arma_dos)
	actualizar_armas_obtenidas()
#GOLPE
func _item_tres_obtenido():
	cola_armas.push_front(sprite_arma_tres)
	actualizar_armas_obtenidas()


func actualizar_armas_obtenidas():
	for i in array_texturas:
		i.texture = null
	for i in cola_armas.size():
		array_texturas[i].texture = cola_armas[i]


		
#	var array = [3, 6, 9]
#	var i = array.size() - 1
#	while i >= 0:
#	    print(array[i])
#	    i -= 1


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


func _on_Btn_menu_pressed():
	get_tree().change_scene("res://Menu_inicio/Menu_inicio.tscn")

