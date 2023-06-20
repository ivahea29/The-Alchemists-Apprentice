extends CanvasLayer

var healthFullTextureRect
var maxHealthWidth = 96

func _ready():
	healthFullTextureRect = $HealthFull
	updateHealthBar()

func _process(delta: float):
	$countScroll.set_text(str(GlobalScript.num_scrolls))
	$countGem.set_text(str(GlobalScript.num_gems))
	
	updateHealthBar()

func updateHealthBar():
	var currentHealth = GlobalScript.playerHealth
	
	var newWidth = maxHealthWidth * currentHealth / GlobalScript.maxPlayerHealth
	
	healthFullTextureRect.size.x = newWidth
