extends Node2D

var screen:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		
	#Retorna a posição global do mouse
	var pos_mouse = get_global_mouse_position()
		
	#Retorna o angulo de direção entre dois pontos
	var angle = position.angle_to_point(pos_mouse)	
	rotation = angle
