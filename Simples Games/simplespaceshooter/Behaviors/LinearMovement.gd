class_name LinearMovement extends Node

@export var object:Node2D
@export var speed:Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:	
	object.translate(speed * delta)
