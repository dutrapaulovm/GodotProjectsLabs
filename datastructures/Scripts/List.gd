class_name List extends Object

var elements:Array = Array()
var nsize = 0
var max_capacity = 5

func _init() -> void:
	print("inicie")
	initialize()

func capacity() -> int:
	return max_capacity
	
func empyt() -> bool:
	return size() == 0
	
func size() -> int:
	return nsize
	
func _ready() -> void:
	pass
	
func resize() -> void:	
	var aux:Array = Array()
	elements = aux

func initialize() -> void:	
	elements.resize(max_capacity)

func add(item:Variant):	
	if nsize+1 >= max_capacity:
		grow()
					
	elements[nsize] = item
	nsize += 1	

#Aumenta o tamanho do vetor
func grow():
	#Define um novo valor para capacidade maxima, aplicando um fator de ajuste 
	var new_capacity:int = nsize + max_capacity
	max_capacity += new_capacity + 2
	
	#Define um novo vetor de acordo com a nova capacidade máxima
	var new_vector:Array = []
	new_vector.resize(max_capacity)
	
	#Copiando os elementos para o novo vetor
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
