class_name EnemyShip extends Area2D
@onready var scale_behavior: ScaleBehavior = $Behaviors/ScaleBehavior
@onready var shake_object: ShakeObject = $Behaviors/ShakeObject
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_area_entered(area: Area2D) -> void:	
	if area is LaserRed:
		audio_stream_player.pitch_scale = randf_range(0.6, 1.5)
		audio_stream_player.play()
		area.queue_free()
		shake_object.shake()
		scale_behavior.start()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	audio_stream_player.pitch_scale = randf_range(0.6, 1.5)
	audio_stream_player.play()	
	queue_free()
	
