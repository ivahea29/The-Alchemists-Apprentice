extends CanvasLayer

@onready var pausemenucontrol = $pausemenucontrol

func _ready():
	pausemenucontrol.visible = false
	
func _process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		if(pausemenucontrol.visible == false):
			pausemenucontrol.visible = true
		elif(pausemenucontrol.visible == true):
			pausemenucontrol.visible = false

func _on_resumebtn_pressed():
	pausemenucontrol.visible = false
	get_tree().paused = false

func _on_quitbtn_pressed():
	get_tree().quit()

func _on_main_menubtn_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
