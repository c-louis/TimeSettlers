extends KinematicBody2D

var velocity = Vector2(0, 0)
var speed = 400
var jump_speed = 5
var gravity = 10

func _process(delta):
	var left = -int(Input.is_action_pressed("mov_left"))
	var right = int(Input.is_action_pressed("mov_right"))
	var jump = int(Input.is_action_pressed("mov_jump"))
	
	velocity.x = (left + right) * speed
	
	if (velocity.x == 0):
		get_node("Animator").current_animation = "idle"
	else:
		get_node("Animator").current_animation = "walk"
	
	if (velocity.x < 0):
		get_node("Hitbox/Player").flip_h = true
	elif (velocity.x > 0):
		get_node("Hitbox/Player").flip_h = false
	
	if (false):
		velocity.y = jump * jump_speed
	else:
		velocity.y += gravity
	
	print(velocity)
	
	move_and_slide(velocity, Vector2(0, -1))