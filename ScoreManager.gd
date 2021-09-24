extends Node

var started = false
var caught = 0
var missed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_game():
	self.started = true
	self.caught = 0
	self.missed = 0
	
func stop_game():
	self.started = false

func add_caught():
	if self.started:
		self.caught += 1
	
func add_missed():
	if self.started:
		self.missed += 1
