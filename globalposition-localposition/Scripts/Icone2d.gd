class_name Icone2D extends Node2D

@onready var icone_2d: Icone2D = $"."
@onready var sprite_2d: Sprite2D = $"Sprite2D" 

func _ready() -> void:
	pass
				
func _process(delta: float) -> void:	
	# Exibe os valores da posição global e local do nó Icone2D em relação ao mundo.
	print("Icone2D => Global Position: ", icone_2d.global_position, " Local Position: ", icone_2d.position)
	
	# Exibe os valores da posição global e local do nó Sprite2d em relação o nó Icone2D
	print("Sprite2D => Global Position: ", sprite_2d.global_position, " Local Position: ", sprite_2d.position)
		
	#Altera a posição local do nó Icone2D
	icone_2d.position = get_global_mouse_position()
