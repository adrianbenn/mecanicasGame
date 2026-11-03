extends CharacterBody3D

@export var speed := 10.0
@export var jump_speed := 0.5

@onready var animation_player = $AnimationPlayer

#Esc para salir
func _input(_delta):
	if Input.is_action_pressed("salir"):
		get_tree().quit()


func _process(delta: float) -> void:
	# Movimiento
	var input := Input.get_vector("mover_izquierda","mover_derecha","mover_frente","mover_atras")
	
	var move = Vector3(input.x, 0, input.y) * speed
	if is_on_floor():
		
		velocity.x = move.x
		velocity.z = move.z
		
	# salto
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		animation_player.play("jump")
		velocity.y = jump_speed
		
	velocity.y += get_gravity().y * delta
	
	move_and_slide()
	
