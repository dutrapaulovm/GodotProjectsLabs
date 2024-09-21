extends Node

var list:List

func _ready() -> void:	
	list = List.new()
	#for i in range(20):
#		create_item()
				
func create_item():
	randomize()
	var number = randi_range(0, 2000)	
	list.add(number)
	var item = str(number) + " => Size " + str(list.size()) + "; Capacity : " + str(list.capacity())
	print(item)

func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:	
	create_item()
	
func _on_btn_imprir_pressed() -> void:
	for i in range(list.size()):
		var item = str(list.get_element(i)) + " => Size " + str(list.size()) + "; Capacity : " + str(list.capacity())
		print(item)
