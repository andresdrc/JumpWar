extends KinematicBody2D


export var vel_avanzar = 300
export var fuerza_salto = 900
export var gravedad = 1500
var direccion = Vector2.ZERO

var salud = 100
onready var barra_salud = $TextureProgress

var pad

onready var sprt_apuntar = $SpriteApuntar
var rot_apuntar = 0.0

signal item_uno_obtenido
signal item_dos_obtenido
signal item_tres_obtenido

var pila_armas = []
var arma_uno = preload("res://item/item_uno/Arma_uno.tscn")
var arma_dos = preload("res://item/item_dos/Arma_dos.tscn")
var arma_tres = preload("res://item/item_tres/Arma_tres.tscn")

onready var  punto_disparo = $SpriteApuntar/Position2D

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


func _no_apuntar(dir):
	sprt_apuntar.visible = false
	
	if not pila_armas.empty():
		var nodo = pila_armas.pop_front()
		get_parent().add_child(nodo)
		nodo.global_position = punto_disparo.global_position
		nodo.lanzar(dir)


func _apuntar(rot):
	sprt_apuntar.visible = true
	rot_apuntar = rot


func _on_Area2D_area_entered(area):
	if area.is_in_group("item_uno"):
		if pila_armas.size() <= 3 :
			emit_signal("item_uno_obtenido")
			var nodo = arma_uno.instance()
			pila_armas.append(nodo)
			area.queue_free()
	if area.is_in_group("item_dos"):
		if pila_armas.size() <= 3 :
			emit_signal("item_dos_obtenido")
			var nodo = arma_dos.instance()
			pila_armas.append(nodo)
			area.queue_free()
	if area.is_in_group("item_tres"):
		if pila_armas.size() <= 3 :
			emit_signal("item_tres_obtenido")
			var nodo = arma_tres.instance()
			pila_armas.append(nodo)
			area.queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("arma_uno"):
		stun()
		body.queue_free()
	if body.is_in_group("arma_dos"):
		inmovil()
		body.queue_free()
	if body.is_in_group("arma_tres"):
		salud -= 45
		barra_salud.value = salud
		body.queue_free()

func stun():
	var vel_ini = vel_avanzar
	var fuerza_salto_ini = fuerza_salto
	var gravedad_ini = gravedad
	
	vel_avanzar -= (vel_avanzar/3) * 2
	fuerza_salto -= (fuerza_salto/3) * 2
	
	yield(get_tree().create_timer(4),"timeout")
	
	vel_avanzar = vel_ini
	fuerza_salto = fuerza_salto_ini
	gravedad = gravedad_ini
	
func inmovil():
	var vel_ini = vel_avanzar
	var fuerza_salto_ini = fuerza_salto
	var gravedad_ini = gravedad
	
	vel_avanzar = 0
	fuerza_salto = 0
	
	yield(get_tree().create_timer(4),"timeout")
	
	vel_avanzar = vel_ini
	fuerza_salto = fuerza_salto_ini
	gravedad = gravedad_ini

