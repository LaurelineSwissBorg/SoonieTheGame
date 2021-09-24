extends Area2D

const CoinScene = preload("res://Bitcoin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport = get_viewport_rect()
	self.position = viewport.position - Vector2(0, viewport.size.y / 2 + 50)
	
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(viewport.size.x / 2, 20))
	
	$spawn_area.shape = shape
	$spawn_timer.connect("timeout", self, "spawn_coin")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if ScoreManager.started:
			$spawn_timer.stop()
			ScoreManager.stop_game()
		else:
			$spawn_timer.start()
			ScoreManager.start_game()

func spawn_coin():
	var center = self.position + $spawn_area.position
	var size = $spawn_area.shape.extents
	
	var spawn_position = Vector2()
	spawn_position.x = (randi() % int(size.x)) - (size.x/2) + center.x
	spawn_position.y = center.y
	
	var coin = CoinScene.instance()
	coin.position = spawn_position
	coin.scale = Vector2(0.1, 0.1)
	get_parent().add_child_below_node(self, coin)
