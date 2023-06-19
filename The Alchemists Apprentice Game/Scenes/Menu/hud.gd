extends CanvasLayer

var global_script

func _ready():
	global_script = load("res://GlobalScripts/global_script.gd").new()

func _process(delta: float):
	$countScroll.set_text(str(GlobalScript.num_scrolls))
	$countGem.set_text(str(GlobalScript.num_gems))
