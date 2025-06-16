class_name ShakeObject extends Node

@export var object:Node2D
@export var shake_duration:float = 0.4
@export var shake_amount:float = 2.0
var shake_count_down = 0 
var start_shake = false

func _ready() -> void:
	shake_count_down = shake_amount
	start_shake = false
	
# Start the shake object
func shake() -> void:
	if not start_shake:
		shake_count_down = shake_amount
		start_shake = true

func _physics_process(delta: float) -> void:
	if shake_count_down >= 0 and start_shake:
		shake_count_down -= shake_duration
		var x = randi_range(-shake_amount, shake_amount)
		var y = randi_range(-shake_amount, shake_amount)
		var pos_shake = Vector2(x, y)
		object.position = pos_shake
	
	if shake_count_down < 0:
		start_shake = false	
		
	
