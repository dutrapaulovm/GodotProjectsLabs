class_name ScoreBehavior extends Node

@export var amount:int = 5
@export var highscore: int = 0

@export var score: int = 0 :
	set(value):
		score = value
		score_changed.emit(score)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_score(amount: int = amount):
		score += amount	
	
signal score_changed(new_score)	
