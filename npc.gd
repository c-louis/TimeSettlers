extends Area2D

export var Player : NodePath
onready var body = get_node(Player)

export (Array, String) var text
var index = 0

func start_dialog():
	pass

func _process(delta):
	if overlaps_body(body) and Input.is_action_just_pressed("talk"):
		start_dialog()
