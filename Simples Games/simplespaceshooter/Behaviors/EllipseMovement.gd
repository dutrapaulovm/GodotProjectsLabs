class_name EllipseMovement extends Node

@export var radius_movement:Vector2 = Vector2(100, 100) # Raio do movimento em X e Y
@export var object:Node2D
@export var loop_duration:float = 6 # Duração do loop completo (opcional)
@export var angle_speed:float = 1  # Velocidade do movimento angular
var movement_angle:float = 0
var point_origin:Vector2 = Vector2.ZERO

func _ready() -> void:
	# Define o ponto de origem como a posição inicial do objeto
	point_origin = object.global_position

func _physics_process(delta: float) -> void:
	# Calcula a velocidade angular com base na duração do loop (uma volta completa em 'loop_duration' segundos)
	if loop_duration > 0:
		angle_speed = (2 * PI) / loop_duration
					
	# Incrementa o ângulo de movimento
	movement_angle += angle_speed * delta
	
	# Calcula a nova posição usando seno e cosseno para o movimento circular
	var new_position:Vector2 = Vector2.ZERO
		
	new_position.x = point_origin.x + radius_movement.x * cos(movement_angle)
	if (radius_movement.y != 0):
		new_position.y = point_origin.y + radius_movement.y * sin(movement_angle)
	else:
		new_position.y = object.global_position.y
	
	# Atualiza a posição do objeto
	object.global_position = new_position
