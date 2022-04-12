extends Node2D

export (PackedScene) var Plataforma

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlataformaTimer.start()
	
	randomize()


func _physics_process(delta):
	get_node("Background").scroll_base_offset += Vector2(0,1)*30*delta


func _on_PataformaTimer_timeout():

	get_node("PlataformaPath/PlataformaPathFollow").set_offset(randi())
	var plataforma = Plataforma.instance()
	add_child(plataforma)
	plataforma.position = get_node("PlataformaPath/PlataformaPathFollow").position
	$PlataformaTimer.wait_time = Global.random(1,2)
	$PlataformaTimer.start()

