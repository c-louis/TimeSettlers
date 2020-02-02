extends Area2D

export var Player : NodePath
onready var body = get_node(Player)

export var TextBox : NodePath
onready var box = get_node(TextBox)

export var TextLabel : NodePath
onready var label = get_node(TextLabel)

export var ChooseBox : NodePath
onready var choose = get_node(ChooseBox)

export var ChooseLabel : NodePath
onready var ch_label = get_node(ChooseLabel)

export (Array, Array, String) var text
var index_maj = 0
var index_min = -1

var is_choosing = 0
var choice_data = {}

var time = 0
var step = .1

var max_time = 5

func setup_choice(text):
	choose.visible = true
	var content = text.substr(1, text.length() - 1)
	var choices = content.split(";")
	var final = ""
	var counter = 1
	for step in choices:
		var index = step.find_last("<")
		var before = step.substr(0, index)
		var after = step.substr(index + 1, step.length() - 1)
		final += str(counter) + ": " + before + "\n"
		choice_data[counter] = int(after)
		counter += 1
	ch_label.text = final
	is_choosing = 1

func step_dialog():
	if label.visible_characters != label.text.length():
		label.visible_characters = label.text.length()
		return
	if index_min < text[index_maj].size() - 1:
		index_min += 1
	else:
		index_min = 0
	if index_maj == text.size():
		index_maj = 0
	if box.visible == false:
		box.visible = true
	if text[index_maj][index_min].find("<") == 0:
		setup_choice(text[index_maj][index_min])
	else:
		label.visible_characters = 0
		label.text = text[index_maj][index_min]

func _input(event):
	if event is InputEventKey and event.pressed and overlaps_body(body) and is_choosing:
		if event.scancode == KEY_1:
			index_maj = choice_data[1]
		elif event.scancode == KEY_2:
			index_maj = choice_data[2]
		else:
			return
		step_dialog()
		choose.visible = false
	pass

func _process(delta):
	time += delta
	if time > step and label.visible_characters != label.text.length():
		label.visible_characters += 1
		time = 0
	if time > max_time:
		box.visible = false
	if overlaps_body(body) and Input.is_action_just_pressed("talk"):
		step_dialog()