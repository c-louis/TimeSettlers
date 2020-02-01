extends Area2D

export var player_path:String;
onready var player = get_node(player_path)

export var text:PoolStringArray;

var dialog = ["Bonjour voyageur !", "J'ai perdu ma hache dans ce fossé"]
var index = 0

func start_dialog():
	get_node("../text_box")
	print("hey")
	pass

func _process(delta):
	if overlaps_body(player) and Input.is_action_just_pressed("talk"):
		start_dialog()
