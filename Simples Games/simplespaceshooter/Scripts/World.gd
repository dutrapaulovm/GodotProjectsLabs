extends Node2D
@onready var enemy_ship_3: Area2D = $Enemies/EnemyShip3
@onready var ship: Area2D = $Ship

# Tamanho do tile (bloco) no grid
var tile_size:int = 64

# Tamanho do viewport
var viewport_size:Vector2

# Número de linhas e colunas no grid
var row:int = 0
var col:int = 0

var enemy_position:Vector2

var resolutions = [
	Vector2(640, 360),  # Resolução menor
	Vector2(1280, 720), # Resolução padrão
	Vector2(1280, 768), # Resolução padrão
	Vector2(1920, 1080) # Resolução maior	
]

var current_resolution_index = 1

func change_resolution() -> void:
	current_resolution_index = (current_resolution_index + 1) % resolutions.size()
	set_resolution(current_resolution_index)

func _input(event):
	if event.is_action_pressed("ui_page_down"):
		change_resolution()

func set_resolution(index: int) -> void:
	
	var resolution:Vector2 = resolutions[index]
	 	
	
	# Atualiza o tamanho da janela com DisplayServer
	DisplayServer.window_set_size(resolution)
	
	## Ajusta o viewport do root para a nova resolução
	get_viewport().size = resolution	

	# Se estiver em tela cheia, ocupa toda a área da tela
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_size(DisplayServer.screen_get_size())
	
	print("Resolução alterada para: ", resolution)
	queue_redraw()
	
# Função executada quando o nó está pronto
func _ready():
	# Configurar esticamento do jogo
	#ProjectSettings.set_setting("display/window/stretch_mode", "viewport")
	#ProjectSettings.set_setting("display/window/stretch_aspect", "keep")
	
 	# Iniciar em tela cheia
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	# Configurar a resolução interna inicial
	#set_resolution(current_resolution_index)
	
	# Retorna um retângulo (Rect2) que descreve a área visível da tela.
	viewport_size = get_viewport().get_visible_rect().size #resolutions[current_resolution_index]
	
	enemy_position = enemy_ship_3.position
	# Obtém o tamanho da janela da Viewport	
	
	# Calcula o número de linhas e colunas no grid, arredondando para baixo
	row = ceil(viewport_size.y / tile_size)
	col = ceil(viewport_size.x / tile_size)
	
	
# Função chamada a cada frame; delta é o tempo decorrido desde o último frame
func _physics_process(delta: float) -> void:
	# Retorna um retângulo (Rect2) que descreve a área visível da tela.
	viewport_size = get_viewport().get_visible_rect().size
	queue_redraw()		

# Função responsável por desenhar o grid na tela
func _draw():	
	
	# Desenha as linhas horizontais do grid
	for curr_row in range(row):
		var y = curr_row * tile_size
		draw_grid_line(Vector2(0, y), Vector2(viewport_size.x, y), Vector2(0, y), str(Vector2(0, y)))

	# Desenha as linhas verticais do grid
	for curr_col in range(col):
		var x = curr_col * tile_size
		draw_grid_line(Vector2(x, 0), Vector2(x, viewport_size.y), Vector2(x, tile_size), str(Vector2(x, tile_size)))		
	
	# Desenha o texto (coordenadas) na posição especificada	
	var default_font = ThemeDB.fallback_font
	var default_font_size = ThemeDB.fallback_font_size
	draw_string(default_font, Vector2(128, 128) , str(viewport_size) + " " + str(get_viewport().size), HORIZONTAL_ALIGNMENT_LEFT, -1, default_font_size)	
	draw_string(default_font, Vector2(128, 192) , str(ship.global_position), HORIZONTAL_ALIGNMENT_LEFT, -1, default_font_size)
	
# Função auxiliar para desenhar uma linha e adicionar o texto correspondente
func draw_grid_line(start: Vector2, end: Vector2, text_pos: Vector2, label: String):
	# Desenha a linha de start a end com uma cor vermelha e espessura de 2.0
	draw_line(start, end, Color(1,0,0), 2.0)
	
	# Desenha o texto (coordenadas) na posição especificada
	var default_font = ThemeDB.fallback_font
	var default_font_size = ThemeDB.fallback_font_size
	draw_string(default_font, text_pos, label, HORIZONTAL_ALIGNMENT_LEFT, -1, default_font_size)
