extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if Achievement.paleo == 1:
		get_node("paleo").clear()
		get_node("paleo").add_text("Paleolithic")
	else:
		get_node("paleo").clear()
		get_node("paleo").add_text("*********")
	if Achievement.roman == 1:
		get_node("roman").clear()
		get_node("roman").add_text("Roman Empire")
	else:
		get_node("roman").clear()
		get_node("roman").add_text("***********")
	if Achievement.magic_roman == 1:
		get_node("magic_roman").clear()
		get_node("magic_roman").add_text("Magic Roman")
	else:
		get_node("magic_roman").clear()
		get_node("magic_roman").add_text("***********")
	if Achievement.ww2 == 1:
		get_node("ww2").clear()
		get_node("ww2").add_text("2nd WorldWar")
	else:
		get_node("ww2").clear()
		get_node("ww2").add_text("***********")
	if Achievement.suicidal_sect == 1:
		get_node("suicidal").clear()
		get_node("suicidal").add_text("Suicidal Sect")
	else:
		get_node("suicidal").clear()
		get_node("suicidal").add_text("***********")
	if Achievement.victory == 1:
		get_node("victory").clear()
		get_node("victory").add_text("Suicidal Sect")
	else:
		get_node("victory").clear()
		get_node("victory").add_text("***********")
	if Achievement.flat == 1:
		get_node("secret_separator").clear()
		get_node("secret_separator").add_text(">")
	else:
		get_node("secret_separator").clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://MainMenu.tscn")
