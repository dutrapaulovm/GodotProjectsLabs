class_name EnforceLimitsWindow extends Node

@export var limits_begin:Vector2 = Vector2.ZERO
@export var limits_end:Vector2 = Vector2.ZERO
@export var offset:Vector2 = Vector2(16, 16)
@export var object:Node2D
var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")

func _physics_process(delta: float) -> void:
	if limits_begin == Vector2.ZERO and limits_end == Vector2.ZERO:
		var view_port:Vector2 = get_viewport().get_visible_rect().size
		limits_begin += offset		
		limits_end += view_port - offset
						
	object.global_position = object.global_position.clamp(limits_begin, limits_end)
