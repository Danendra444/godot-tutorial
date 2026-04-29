extends CharacterBody2D

@export var SPEED: int = 400
@export var UP_GRAVITY: int = 1000
@export var DOWN_GRAVITY: int = 1200
@export var JUMP_POWER: int = 500

var direction: Vector2


func _process(delta: float) -> void:
	direction = Vector2.ZERO

	if is_on_floor():
		velocity.y = 0
		direction.y = 0
	elif velocity.y < 0:
		velocity.y += UP_GRAVITY * delta
		direction.y = -1
	else:
		velocity.y += DOWN_GRAVITY * delta
		direction.y = 1

	if Input.is_action_pressed("Right"):
		direction.x += 1
	if Input.is_action_pressed("Left"):
		direction.x -= 1

	if Input.is_action_just_pressed("Up") and self.is_on_floor():
		velocity.y -= JUMP_POWER

	velocity.x = direction.x * SPEED

	if direction.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
	elif velocity.y == 0 and velocity.x != 0:
		$AnimatedSprite2D.play("walk")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("jump_up")
	else:
		$AnimatedSprite2D.play("jump_down")

	move_and_slide()
