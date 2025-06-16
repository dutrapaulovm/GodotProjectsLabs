class_name Background extends ParallaxBackground

var speed:float = 200
@onready var background_01: TextureRect = $ParallaxLayer/Background01
@onready var background_02: TextureRect = $ParallaxLayer/Background02
@onready var parallax_layer: ParallaxLayer = $ParallaxLayer

func _physics_process(delta: float) -> void:	
	var velocity:Vector2 = Vector2.DOWN * speed * delta	
	parallax_layer.motion_offset.y += speed * delta
