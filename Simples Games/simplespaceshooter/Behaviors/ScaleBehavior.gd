class_name ScaleBehavior extends Node

# Variável exportada para atribuir o sprite que será escalado (do tipo Node2D).
@export var sprite: Node2D

# Define o valor da escala final (escala-alvo) para o sprite. O padrão é (1.5, 1.5), ou seja, o sprite será aumentado em 50%.
@export var scale_amount: Vector2 = Vector2(1.5, 1.5)

# Define a duração total da animação de escala (em segundos). O padrão é 0.5 segundos.
@export var scale_duration: float = 0.5

# Função que inicia o comportamento de escala do sprite.
func start() -> void:
	# Cria um novo objeto Tween, que será responsável pela interpolação da animação.
	var tween: Tween = create_tween()
	
	# Define o tipo de transição da animação como exponencial (TRANS_EXPO).
	# E define o comportamento de easing como EASE_OUT, ou seja, a animação começa rápida e desacelera no final.
	tween.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	# Escala o sprite do valor atual de escala até o valor definido em 'scale_amount' (por padrão, 1.5x), 
	# em 10% da duração total da animação (0.1 * scale_duration).
	tween.tween_property(sprite, "scale", scale_amount, scale_duration * 0.1).from_current()
	
	# Retorna o sprite à escala original (Vector2.ONE, ou seja, 1.0x) a partir do valor de 'scale_amount',
	# nos 90% restantes da duração da animação (0.9 * scale_duration).
	tween.tween_property(sprite, "scale", Vector2.ONE, scale_duration * 0.9).from(scale_amount)
