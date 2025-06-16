extends Node2D
@onready var sprite_origin: Sprite2D = $SpriteOrigin
@onready var sprite_target: Sprite2D = $SpriteTarget
@onready var magnitude_label: Label = $Control/MagnitudeLabel
@onready var angle_label: Label = $Control/AngleLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pos_origin = sprite_origin.position
	var pos_target = sprite_target.position
	var direction:float = rad_to_deg(pos_origin.direction_to(pos_target).angle())
	var magnitude:float = pos_origin.distance_to(pos_target)
	angle_label.text = "Direction: " + str(direction)
	magnitude_label.text = "Magnitude: " +  str(magnitude)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
