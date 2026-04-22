extends CharacterBody2D

@export var speed: int = 200
@onready var ray: RayCast2D = $RayCast2D
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	direction = ray.target_position.normalized()
	velocity = direction * speed

func _process(delta: float) -> void:
	velocity.x = direction.x * speed
	if not is_on_floor():
		velocity += get_gravity()
	else:
		velocity.y = 0

	if ray.is_colliding():
		direction.x *= -1
		scale.x *= -1

	move_and_slide()
