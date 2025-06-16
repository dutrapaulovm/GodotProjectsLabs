extends Area2D

var speed:float = 350
var velocity:Vector2 = Vector2(0, 0)
@onready var fire_rate: Timer = $fire_rate

var count_fire_rate = 0
var fired = false
@onready var point_shooter: Marker2D = $PointShooter
const LASER_RED:Resource = preload("res://Prefabs/LaserRed.tscn")
@onready var fire_bullet: FireBullet = $FireBullet
	
func input() -> Vector2:	
	var direction:Vector2 = Vector2.ZERO	
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT	
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT	
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN

	if Input.is_action_pressed("ui_select"):
		fire_bullet.fire()
		
	return direction
		
func movement(delta:float) -> void:
	var direction:Vector2 = input()		
	velocity = speed * direction	
	position += velocity * delta
	
func _physics_process(delta: float) -> void:		
	movement(delta)

func _on_fire_rate_timeout() -> void:
	fired = false
