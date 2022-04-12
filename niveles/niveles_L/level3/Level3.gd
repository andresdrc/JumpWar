extends Node2D

export (PackedScene) var Transportador

func _ready():
	$TransportadorTimer.start()
	randomize()
	
func _physics_process(delta):
	get_node("Background").scroll_base_offset += Vector2(0, 1) * 8 * delta

func _on_TransportadorTimer_timeout():
	#$PlataformPath/PlataformSpawn.set_offset(randi())
	get_node("TransportadorPath/TransportadorSpawn").set_offset(randi())
	var transportador = Transportador.instance()
	add_child(transportador)
	transportador.position = get_node("TransportadorPath/TransportadorSpawn").position
	$TransportadorTimer.wait_time = GLOBAL.random(2, 4)
	$TransportadorTimer.start()
