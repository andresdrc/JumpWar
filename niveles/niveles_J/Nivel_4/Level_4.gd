extends Node2D

export (PackedScene) var Transportador
export (PackedScene) var Plataforma

func _ready():
	$TPTimer.start()
	
	randomize()

func _physics_process(delta):
	get_node("Background_TP").scroll_base_offset += Vector2(0,1)*30*delta

func _on_TPTimer_timeout():
	var ran = RandomNumberGenerator.new()
	ran.randomize()
	var num= int (ran.randf_range(1.0,3.0))
	print('estoes una prueba')
	if  num==1.0:
		get_node("TPPath/TPPathFollow").set_offset(randi())
		var plataforma = Plataforma.instance()
		add_child(plataforma)
		plataforma.position = get_node("TPPath/TPPathFollow").position
		$TPTimer.wait_time = Global.random(1,3)
		$TPTimer.start()
	else:
		get_node("TPPath/TPPathFollow").set_offset(randi())
		var transportador = Transportador.instance()
		add_child(transportador)
		transportador.position = get_node("TPPath/TPPathFollow").position
		$TPTimer.wait_time = Global.random(1,3)
		$TPTimer.start()
