class_name GameManager extends Node2D

static var me : Node2D
static var score :  int = 0

static var continious_actions: Signal
# Awake del Godot
func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
# Start de Godot
func _ready() -> void:
	print_debug("Game Started")
	me = self
	score = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Update de Godot
func _process(delta: float) -> void:

	pass

# Fixed Update de Godot
func _physics_process(delta: float) -> void:
	pass

static func delay_action(action: Callable, delay:float) -> void:
	await me.get_tree().create_timer(delay).timeout
	action.call()
	pass
