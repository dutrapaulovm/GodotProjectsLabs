class_name World extends Node

var list:List

func _ready() -> void:	
	list = List.new()
					
func create_item():
	var number = randi_range(0, 2000)	
	list.add(number)	
	var item = str(number) + " => Size " + str(list.size()) + "; Capacity : " + str(list.capacity())
	print(item)		
	#var elements = []
	#elements.resize(10)
	#for i in range(9000000):
	#	randomize()
	#	var number = randi_range(0, 2000)	
	#	list.add(number)
		#elements.append(number)
		#var item = str(number) + " => Size " + str(list.size()) + "; Capacity : " + str(list.capacity())
		#print(item)

func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:		
	print("Start: " + Time.get_time_string_from_system())
	create_item()
	print("End: " + Time.get_time_string_from_system())
			
func _on_btn_imprir_pressed() -> void:
	for i in range(list.size()):
		var item = str(list.get_element(i)) + " => Size " + str(list.size()) + "; Capacity : " + str(list.capacity())
		print(item)
