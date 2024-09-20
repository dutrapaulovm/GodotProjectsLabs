extends Node2D

const ICON:Resource = preload("res://Prefabs/icone_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
func _input(event: InputEvent) -> void:
	# Verifica se o evento executado é do tipo InputEventMouseButton e se foi
	# pressionado o botão
	if event is InputEventMouseButton and event.is_pressed():
		#Convertendo o objeto para o tipo InputEventMouseButton
		var evt:InputEventMouseButton = event as InputEventMouseButton
		#Verificando se pressionou o botão esquerdo
		if evt.button_index == MOUSE_BUTTON_LEFT:
			#Criando um instância do objeto Icone2D			
			var icone2d = ICON.instantiate()
			icone2d.position = evt.position
			add_child(icone2d)
