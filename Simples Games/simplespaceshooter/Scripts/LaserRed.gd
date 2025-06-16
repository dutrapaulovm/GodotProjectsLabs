class_name LaserRed extends Area2D

func _ready() -> void:
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:	
	queue_free()
