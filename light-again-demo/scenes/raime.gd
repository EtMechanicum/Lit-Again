extends Node2D

var speed = 300
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	#hide()
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$CharacterBody2D/AnimatedSprite2D.play()
	else:
		$CharacterBody2D/AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x > 0:
		$CharacterBody2D/AnimatedSprite2D.animation = "right"
	elif velocity.x < 0:
		$CharacterBody2D/AnimatedSprite2D.animation = "left"
	elif velocity.y > 0:
		$CharacterBody2D/AnimatedSprite2D.animation = "down"
	elif velocity.y < 0:
		$CharacterBody2D/AnimatedSprite2D.animation = "up"

func start(pos):
	position = pos
	#show()
	$CollisionShape2D.disabled = false
