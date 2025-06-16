class_name FireBullet extends Node

signal start_fire
signal fired

var _fired:bool = false
@export var firing_countdown:float = 0.2
@export var max_ammo:int = 0
@export var total_ammo:int = 0
@export var is_unlimited_ammo = true
var count_down_ammo:int = 0
@export var point_shooter: Marker2D
@export var bullet_resource:Resource
@onready var fire_rate_timer: Timer = $FireRateTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_rate_timer.wait_time = firing_countdown
	fire_rate_timer.timeout.connect(_fired_bullet)
	
func increase_ammo(quantity:int = 1) -> void:
	var ammo = min(quantity, max_ammo)	
	total_ammo += ammo	
	
func decrease_ammo(quantity:int = 1) -> void:
	var ammo = max(0, quantity)	
	total_ammo -= ammo
	
func _create_bullet() -> void:
	if bullet_resource != null and point_shooter != null:
		var laser = bullet_resource.instantiate()
		laser.global_position = point_shooter.global_position
		get_tree().root.add_child(laser)
		
#Fire bullets
func fire() -> void:
	
	if not _fired:
		if not is_unlimited_ammo and total_ammo == 0:
			return
						
		_fired = true
		fire_rate_timer.start()		
		start_fire.emit()		
		
		_create_bullet()
			
		if not is_unlimited_ammo:
			decrease_ammo()
									
func _fired_bullet() -> void:	
	_fired = false
	fired.emit()
		
func _process(delta: float) -> void:
	pass
