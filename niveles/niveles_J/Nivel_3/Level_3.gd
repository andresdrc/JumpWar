extends Node2D

export (PackedScene) var Transportador


func _ready():
	$TransportadorTimer.start()
	randomize()
	
func _physics_process(delta):
	get_node("Background_T").scroll_base_offset += Vector2(0,1)*30*delta


func _on_TransportadorTimer_timeout():
	get_node("TransportadorPath/TransportadorPathFollow").set_offset(randi())
	var transportador = Transportador.instance()
	add_child(transportador)
	transportador.position = get_node("TransportadorPath/TransportadorPathFollow").position
	$TransportadorTimer.wait_time = Global.random(1,3)
	$TransportadorTimer.start()
