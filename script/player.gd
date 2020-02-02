extends KinematicBody2D

var velocity = Vector2(0, 0)
var speed = 400
var jump_speed = -500
var gravity = 10
const UP = Vector2(0, -1)

var on_floor = false

func _process(delta):
	var left = -int(Input.is_action_pressed("mov_left"))
	var right = int(Input.is_action_pressed("mov_right"))
	var jump = int(Input.is_action_pressed("mov_jump"))
	
	velocity.x = (left + right) * speed
	
	if not (velocity.y > 10 or velocity.y < 0):
		if velocity.x == 0:
			get_node("Animator").current_animation = "idle"
		else:
			get_node("Animator").current_animation = "walk"
	
	if velocity.x < 0:
		get_node("Player").flip_h = true
	elif velocity.x > 0:
		get_node("Player").flip_h = false
	
	var collide_inf = move_and_slide(velocity, UP)
	
	if is_on_floor():
		velocity.y = jump * jump_speed
	else:
		velocity.y += gravity
	
	if velocity.y > 10:
		get_node("Animator").current_animation = "falling"
	elif velocity.y < 0:
		get_node("Animator").current_animation = "in_air"
	
