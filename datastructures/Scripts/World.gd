extends Node

var list:List

func _ready() -> void:
	list = List.new()
	for i in range(20):
		create_item()
				
func create_item():
	randomize()
	var number = randi_range(0, 2000)
	var item = str(number) + " => Size " + str(list.size()) + "; Capacity : " + str(list.capacity())
	list.add(item)
	print(item)

func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:	
	create_item()
