class_name Stack extends Node

var elements = []
var nsize: = 0
var max_capacity = 10

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

#Retorna o último elemento da lista sem remover o elemento
func peek() -> Variant:
	if size() > 0:
		return elements[nsize - 1]
				
	return null

#Adiciona um elemento no top da lista
func push(item:Variant):
	if nsize >= max_capacity:
		grow()
	
	elements[nsize] = item
	nsize += 1
			
#Remove o elemento do top da lista e retorna esse elemento
func pop() -> Variant:
	var item
	if nsize > 0:
		item = elements[nsize - 1]
		elements[nsize - 1] = null
		
	return item

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

func size() -> int:
	return nsize

func empty() -> bool:
	return size() == 0
