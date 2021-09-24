extends Sprite

var angle = Vector2(0.0, 1.0)
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	position += angle * (speed * delta)
	

func _on_collision_area_entered(area: Area2D):
	if area.name == "ship_collision":
		ScoreManager.add_caught()
		queue_free()
	elif area.name == "screen_end":
		ScoreManager.add_missed()
		queue_free()
