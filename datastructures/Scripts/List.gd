class_name List extends Node

var elements:Array = Array()
var nsize = 0
var ncapacity = 5

func _init() -> void:
	print("inicie")
	initialize()

func capacity() -> int:
	return ncapacity
			
func size() -> int:
	return nsize
	
func _ready() -> void:
	pass
	
func resize() -> void:	
	var aux:Array = Array()
	elements = aux

func initialize() -> void:	
	elements.resize(ncapacity)

func add(element:Variant):	
	if nsize < ncapacity:
		elements[nsize] = element		
	else:
		grow()
		elements[nsize] = element
	
	nsize += 1	

func grow():
	#Define um novo valor para capacidade maxima, aplicando um fator de ajuste 
	var pref_capacity:int = nsize + (ncapacity + ncapacity) / 2
	ncapacity += pref_capacity + 1
	var new_vector:Array = []
	new_vector.resize(ncapacity)
	for i in range(nsize):
		new_vector[i] = elements[i]
	
	elements = new_vector	

func get_element(index:int) -> Variant:
	if index >= 0 and index < size():
		return elements[index]

	return null

func exists(element):
	for i in range(nsize):
		var item = elements[i]
		if item == element:
			return true
			
	return false
