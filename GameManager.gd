class_name GameManager extends Node2D

static var score :  int = 0
# Awake del Godot
func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
# Start de Godot
func _ready() -> void:
	print_debug("Game Started")
	score = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Update de Godot
func _process(delta: float) -> void:

	pass

# Fixed Update de Godot
func _physics_process(delta: float) -> void:
	pass
