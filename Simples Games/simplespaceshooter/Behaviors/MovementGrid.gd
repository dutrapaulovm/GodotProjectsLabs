class_name MovementGrid extends Node

@export var object:Node2D
# Define o tamanho de cada tile no grid. Nesse caso, cada tile tem 64x64 pixels.
@export var tile_size:int = 64
@export var speed:float = 320
@export var direction:Vector2 = Vector2.ZERO
# Variável que armazenará o tamanho da janela do jogo.
var viewport_size:Vector2= Vector2.ZERO
var towards:Vector2 = Vector2.ZERO
# Função que é chamada assim que o node é inicializado.
func _ready():
	# Ajusta a posição inicial do objeto para que ela se alinhe ao grid.
	object.position = object.position.snapped(Vector2.ONE * tile_size)
	# Obtém o tamanho da janela e armazena em 'size_window'.
		
	viewport_size = get_viewport().get_visible_rect().size #get_tree().root.get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var remainderx:int = int(object.global_position.round().x) % tile_size
	var remaindery:int = int(object.global_position.round().y) % tile_size
	print(remainderx, remaindery)
	if remainderx == 0 and remaindery == 0:
		object.position = object.position.snapped(Vector2.ONE * tile_size)
		towards = Vector2.ZERO
		towards += speed * direction * delta
			
	object.position += towards
