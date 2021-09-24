extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport = get_viewport_rect()
	self.position = viewport.position + Vector2(0, viewport.size.y / 2)
	
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(viewport.size.x / 2, 50))
	$screen_end_area.shape = shape
