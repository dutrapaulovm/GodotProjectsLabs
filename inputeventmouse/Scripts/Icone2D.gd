class_name Icone2D extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:		
	var angle = rad_to_deg(get_angle_to(get_global_mouse_position()))		

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		# Verifica se o evento executado é do tipo InputEventMouseButton e se foi
	# pressionado o botão
	if event is InputEventMouseButton and event.is_pressed():
		#Convertendo o objeto para o tipo InputEventMouseButton
		var evt:InputEventMouseButton = event as InputEventMouseButton
		#Verificando se pressionou o botão direito
		if evt.button_index == MOUSE_BUTTON_RIGHT:
			#remove o objeto da cena
			queue_free()
