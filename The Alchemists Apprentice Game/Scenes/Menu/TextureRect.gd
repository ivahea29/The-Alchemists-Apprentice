extends TextureRect

var target_size = Vector2(200, 200)

func _ready():
	rect_min_size = target_size
	rect_max_size = target_size
